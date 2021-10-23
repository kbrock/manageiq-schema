class RemoveMigrationFeature < ActiveRecord::Migration[6.0]
  class ServiceTemplate < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class MiqRequest < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class MiqRequestTask < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class Job < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class ServiceOrder < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class Vm < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class ConversionHost < ActiveRecord::Base
    self.inheritance_column = :_type_disabled
  end

  class CustomAttribute < ActiveRecord::Base; end
  class Tag < ActiveRecord::Base; end
  class Tagging < ActiveRecord::Base; end

  TRANSFORMATION_PLAN_CLASSES = %w[
    ServiceTemplateTransformationPlan
    ManageIQ::Providers::Openstack::CloudManager::ServiceTemplateTransformationPlan
    ManageIQ::Providers::Redhat::InfraManager::ServiceTemplateTransformationPlan
  ]

  def up
    # These classes inherit from core classes, so we don't drop the tables.
    # Instead we remove the records.
    ServiceTemplate.where(:type => TRANSFORMATION_PLAN_CLASSES).delete_all
    MiqRequest.where(:type => "ServiceTemplateTransformationPlanRequest").delete_all
    MiqRequestTask.where(:type => "ServiceTemplateTransformationPlanTask").delete_all
    Job.where(:type => "InfraConversionJob").delete_all
    ServiceOrder.where(:type => "ServiceOrderV2V").delete_all

    # Conversion hosts can be either a RHV host or VM, or an OpenStack VM
    # We need to clean the resources, i.e. remove tags and custom attributes
    tag_ids = [
      Tag.find_by(:name => '/managed/v2v_transformation_host/false')&.id,
      Tag.find_by(:name => '/managed/v2v_transformation_host/true')&.id,
      Tag.find_by(:name => '/managed/v2v_transformation_method/ssh')&.id,
      Tag.find_by(:name => '/managed/v2v_transformation_method/vddk')&.id
    ].compact
    tag_ids.each do |tag_id|
      Tagging.where(:tag_id => tag_id).delete_all
      Tag.find(tag_id).delete
    end

    ConversionHost.all.each do |chost|
      CustomAttribute.where(
        :resource_id   => chost.resource_id,
        :resource_type => chost.resource_type,
        :name          => 'TransformationIPAddress'
      ).delete_all
    end

    # These tables are used only by Migration feature, so we can drop them.
    drop_table :conversion_hosts
    drop_table :transformation_mappings
    drop_table :transformation_mapping_items
  end

  def down
    create_table "conversion_hosts", comment: "Conversion Hosts", force: :cascade do |t|
      t.string "name", comment: "A symbolic name for the conversion host."
      t.string "address", comment: "The IP address for the conversion host. If present, must be one of the associated resource's IP addresses."
      t.string "type", comment: "The STI type of the conversion host."
      t.string "resource_type", comment: "The STI type of the associated resource."
      t.bigint "resource_id", comment: "The ID of the associated resource."
      t.string "version", comment: "The version of the v2v conversion tool on the conversion host."
      t.integer "max_concurrent_tasks", comment: "The maximum number of concurrent tasks for the conversion host to be considered eligible."
      t.boolean "vddk_transport_supported", comment: "Indicates whether or not vddk transport is supported from the appliance to the conversion host."
      t.boolean "ssh_transport_supported", comment: "Indicates whether or not ssh transport is supported from the appliance to the conversion host."
      t.datetime "created_at", null: false, comment: "The timestamp the conversion host was added to the app inventory."
      t.datetime "updated_at", null: false, comment: "The timestamp the conversion host was last updated within the appliance."
      t.string "concurrent_transformation_limit", comment: "The maximum number of concurrent transformation tasks the conversion host may undertake."
      t.string "cpu_limit", comment: "The CPU percentage limit that the conversion host may use."
      t.string "memory_limit", comment: "The memory limit (in mb) that the conversion host may use."
      t.string "network_limit", comment: "The maximum network (bandwidth) usage that the conversion host may use."
      t.string "blockio_limit", comment: "The block I/O (disk) limit that the conversion host may use."
      t.index ["resource_id", "resource_type"], name: "index_conversion_hosts_on_resource_id_and_resource_type"
      t.index ["resource_type", "resource_id"], name: "index_conversion_hosts_on_resource_type_and_resource_id"
    end

    create_table "transformation_mappings", force: :cascade do |t|
      t.string "name"
      t.string "description"
      t.string "comments"
      t.string "state"
      t.jsonb "options", default: {}
      t.bigint "tenant_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "transformation_mapping_items", force: :cascade do |t|
      t.bigint "source_id"
      t.string "source_type"
      t.bigint "destination_id"
      t.string "destination_type"
      t.bigint "transformation_mapping_id"
      t.jsonb "options", default: {}
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["transformation_mapping_id"], name: "index_transformation_mapping_items_on_transformation_mapping_id"
    end
  end
end
