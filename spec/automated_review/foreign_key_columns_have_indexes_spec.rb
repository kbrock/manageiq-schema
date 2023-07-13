require 'set'

describe "foreign key (*_id) columns" do
  let(:exceptions_list) do
    Set.new(%w[
      authentication_configuration_script_bases.authentication_id
      authentication_orchestration_stacks.orchestration_stack_id
      authentications.evm_owner_id
      authentications.miq_group_id
      authentications.tenant_id
      automate_workspaces.tenant_id
      automate_workspaces.user_id
      canisters.physical_storage_id
      chargeable_fields.chargeback_rate_detail_measure_id
      chargeback_rate_details.chargeable_field_id
      chargeback_rate_details.chargeback_rate_detail_currency_id
      chargeback_rate_details.chargeback_rate_detail_measure_id
      chargeback_tiers.chargeback_rate_detail_id
      cloud_database_servers.resource_group_id
      cloud_databases.cloud_tenant_id
      cloud_databases.resource_group_id
      cloud_networks.orchestration_stack_id
      cloud_networks.provider_segmentation_id
      cloud_object_store_containers.cloud_tenant_id
      cloud_object_store_containers.ems_id
      cloud_object_store_objects.cloud_object_store_container_id
      cloud_object_store_objects.cloud_tenant_id
      cloud_object_store_objects.ems_id
      cloud_resource_quotas.cloud_tenant_id
      cloud_resource_quotas.ems_id
      cloud_subnets.availability_zone_id
      cloud_subnets.network_router_id
      cloud_tenant_flavors.flavor_id
      cloud_tenants.ems_id
      cloud_tenants.parent_id
      cloud_tenants_vms.cloud_tenant_id
      cloud_tenants_vms.vm_id
      cloud_volume_backups.availability_zone_id
      cloud_volume_backups.cloud_volume_id
      cloud_volume_snapshots.cloud_tenant_id
      cloud_volume_snapshots.cloud_volume_id
      cloud_volume_snapshots.ems_id
      cloud_volume_types.ems_id
      cloud_volumes.availability_zone_id
      cloud_volumes.cloud_tenant_id
      cloud_volumes.cloud_volume_snapshot_id
      cloud_volumes.ems_id
      conditions_miq_policies.condition_id
      conditions_miq_policies.miq_policy_id
      configuration_locations.parent_id
      configuration_organizations.parent_id
      configuration_profiles.customization_script_medium_id
      configuration_profiles.customization_script_ptable_id
      configuration_profiles.operating_system_flavor_id
      configuration_profiles.parent_id
      configuration_script_sources.authentication_id
      configuration_script_sources.git_repository_id
      configuration_scripts.configuration_script_source_id
      configuration_scripts.manager_id
      configuration_scripts.parent_id
      configuration_tags.manager_id
      configured_systems.configuration_location_id
      configured_systems.configuration_organization_id
      configured_systems.configuration_profile_id
      configured_systems.customization_script_medium_id
      configured_systems.customization_script_ptable_id
      configured_systems.direct_customization_script_medium_id
      configured_systems.direct_customization_script_ptable_id
      configured_systems.inventory_root_group_id
      configured_systems.operating_system_flavor_id
      container_build_pods.container_build_id
      container_builds.container_project_id
      container_conditions.container_entity_id
      container_env_vars.container_id
      container_groups.container_build_pod_id
      container_groups.container_node_id
      container_groups.container_project_id
      container_groups.container_replicator_id
      container_groups_container_services.container_group_id
      container_groups_container_services.container_service_id
      container_image_registries.ems_id
      container_images.container_image_registry_id
      container_limit_items.container_limit_id
      container_limits.container_project_id
      container_limits.ems_id
      container_nodes.lives_on_id
      container_port_configs.container_id
      container_quota_items.container_quota_id
      container_quota_scopes.container_quota_id
      container_quotas.container_project_id
      container_quotas.ems_id
      container_replicators.container_project_id
      container_replicators.ems_id
      container_routes.container_project_id
      container_routes.container_service_id
      container_service_port_configs.container_service_id
      container_services.container_image_registry_id
      container_services.container_project_id
      container_volumes.common_volume_id
      container_volumes.parent_id
      container_volumes.persistent_volume_claim_id
      custom_buttons.applies_to_id
      customization_templates.pxe_image_type_id
      dialog_field_associations.respond_id
      dialog_field_associations.trigger_id
      dialog_fields.dialog_group_id
      dialog_groups.dialog_tab_id
      dialog_tabs.dialog_id
      disks.backing_id
      disks.storage_profile_id
      entitlements.miq_user_role_id
      event_streams.container_group_id
      event_streams.container_id
      event_streams.container_node_id
      event_streams.container_replicator_id
      event_streams.dest_ems_cluster_id
      event_streams.group_id
      event_streams.physical_chassis_id
      event_streams.physical_server_id
      event_streams.physical_storage_id
      event_streams.physical_switch_id
      event_streams.target_id
      event_streams.tenant_id
      event_streams.user_id
      ext_management_systems.provider_id
      ext_management_systems.tenant_id
      ext_management_systems.zone_id
      firewall_rules.source_security_group_id
      firmware_binaries_firmware_targets.firmware_target_id
      floating_ips.vm_id
      generic_objects.generic_object_definition_id
      git_references.git_repository_id
      git_repositories.authentication_id
      guest_applications.container_image_id
      hardwares.canister_id
      hardwares.switch_id
      host_aggregate_hosts.host_aggregate_id
      host_service_groups.host_id
      host_storages.storage_id
      host_switches.host_id
      host_switches.switch_id
      hosts.ems_cluster_id
      hosts.physical_server_id
      iso_images.pxe_image_type_id
      key_pairs_vms.authentication_id
      lans.parent_id
      log_files.file_depot_id
      metric_rollups_01.parent_ems_cluster_id
      metric_rollups_01.parent_ems_id
      metric_rollups_01.parent_host_id
      metric_rollups_01.parent_storage_id
      metric_rollups_01.time_profile_id
      metric_rollups_02.parent_ems_cluster_id
      metric_rollups_02.parent_ems_id
      metric_rollups_02.parent_host_id
      metric_rollups_02.parent_storage_id
      metric_rollups_02.time_profile_id
      metric_rollups_03.parent_ems_cluster_id
      metric_rollups_03.parent_ems_id
      metric_rollups_03.parent_host_id
      metric_rollups_03.parent_storage_id
      metric_rollups_03.time_profile_id
      metric_rollups_04.parent_ems_cluster_id
      metric_rollups_04.parent_ems_id
      metric_rollups_04.parent_host_id
      metric_rollups_04.parent_storage_id
      metric_rollups_04.time_profile_id
      metric_rollups_05.parent_ems_cluster_id
      metric_rollups_05.parent_ems_id
      metric_rollups_05.parent_host_id
      metric_rollups_05.parent_storage_id
      metric_rollups_05.time_profile_id
      metric_rollups_06.parent_ems_cluster_id
      metric_rollups_06.parent_ems_id
      metric_rollups_06.parent_host_id
      metric_rollups_06.parent_storage_id
      metric_rollups_06.time_profile_id
      metric_rollups_07.parent_ems_cluster_id
      metric_rollups_07.parent_ems_id
      metric_rollups_07.parent_host_id
      metric_rollups_07.parent_storage_id
      metric_rollups_07.time_profile_id
      metric_rollups_08.parent_ems_cluster_id
      metric_rollups_08.parent_ems_id
      metric_rollups_08.parent_host_id
      metric_rollups_08.parent_storage_id
      metric_rollups_08.time_profile_id
      metric_rollups_09.parent_ems_cluster_id
      metric_rollups_09.parent_ems_id
      metric_rollups_09.parent_host_id
      metric_rollups_09.parent_storage_id
      metric_rollups_09.time_profile_id
      metric_rollups_10.parent_ems_cluster_id
      metric_rollups_10.parent_ems_id
      metric_rollups_10.parent_host_id
      metric_rollups_10.parent_storage_id
      metric_rollups_10.time_profile_id
      metric_rollups_11.parent_ems_cluster_id
      metric_rollups_11.parent_ems_id
      metric_rollups_11.parent_host_id
      metric_rollups_11.parent_storage_id
      metric_rollups_11.time_profile_id
      metric_rollups_12.parent_ems_cluster_id
      metric_rollups_12.parent_ems_id
      metric_rollups_12.parent_host_id
      metric_rollups_12.parent_storage_id
      metric_rollups_12.time_profile_id
      metric_rollups_base.parent_ems_cluster_id
      metric_rollups_base.parent_ems_id
      metric_rollups_base.parent_host_id
      metric_rollups_base.parent_storage_id
      metric_rollups_base.resource_id
      metric_rollups_base.time_profile_id
      metrics_00.parent_ems_cluster_id
      metrics_00.parent_ems_id
      metrics_00.parent_host_id
      metrics_00.parent_storage_id
      metrics_00.time_profile_id
      metrics_01.parent_ems_cluster_id
      metrics_01.parent_ems_id
      metrics_01.parent_host_id
      metrics_01.parent_storage_id
      metrics_01.time_profile_id
      metrics_02.parent_ems_cluster_id
      metrics_02.parent_ems_id
      metrics_02.parent_host_id
      metrics_02.parent_storage_id
      metrics_02.time_profile_id
      metrics_03.parent_ems_cluster_id
      metrics_03.parent_ems_id
      metrics_03.parent_host_id
      metrics_03.parent_storage_id
      metrics_03.time_profile_id
      metrics_04.parent_ems_cluster_id
      metrics_04.parent_ems_id
      metrics_04.parent_host_id
      metrics_04.parent_storage_id
      metrics_04.time_profile_id
      metrics_05.parent_ems_cluster_id
      metrics_05.parent_ems_id
      metrics_05.parent_host_id
      metrics_05.parent_storage_id
      metrics_05.time_profile_id
      metrics_06.parent_ems_cluster_id
      metrics_06.parent_ems_id
      metrics_06.parent_host_id
      metrics_06.parent_storage_id
      metrics_06.time_profile_id
      metrics_07.parent_ems_cluster_id
      metrics_07.parent_ems_id
      metrics_07.parent_host_id
      metrics_07.parent_storage_id
      metrics_07.time_profile_id
      metrics_08.parent_ems_cluster_id
      metrics_08.parent_ems_id
      metrics_08.parent_host_id
      metrics_08.parent_storage_id
      metrics_08.time_profile_id
      metrics_09.parent_ems_cluster_id
      metrics_09.parent_ems_id
      metrics_09.parent_host_id
      metrics_09.parent_storage_id
      metrics_09.time_profile_id
      metrics_10.parent_ems_cluster_id
      metrics_10.parent_ems_id
      metrics_10.parent_host_id
      metrics_10.parent_storage_id
      metrics_10.time_profile_id
      metrics_11.parent_ems_cluster_id
      metrics_11.parent_ems_id
      metrics_11.parent_host_id
      metrics_11.parent_storage_id
      metrics_11.time_profile_id
      metrics_12.parent_ems_cluster_id
      metrics_12.parent_ems_id
      metrics_12.parent_host_id
      metrics_12.parent_storage_id
      metrics_12.time_profile_id
      metrics_13.parent_ems_cluster_id
      metrics_13.parent_ems_id
      metrics_13.parent_host_id
      metrics_13.parent_storage_id
      metrics_13.time_profile_id
      metrics_14.parent_ems_cluster_id
      metrics_14.parent_ems_id
      metrics_14.parent_host_id
      metrics_14.parent_storage_id
      metrics_14.time_profile_id
      metrics_15.parent_ems_cluster_id
      metrics_15.parent_ems_id
      metrics_15.parent_host_id
      metrics_15.parent_storage_id
      metrics_15.time_profile_id
      metrics_16.parent_ems_cluster_id
      metrics_16.parent_ems_id
      metrics_16.parent_host_id
      metrics_16.parent_storage_id
      metrics_16.time_profile_id
      metrics_17.parent_ems_cluster_id
      metrics_17.parent_ems_id
      metrics_17.parent_host_id
      metrics_17.parent_storage_id
      metrics_17.time_profile_id
      metrics_18.parent_ems_cluster_id
      metrics_18.parent_ems_id
      metrics_18.parent_host_id
      metrics_18.parent_storage_id
      metrics_18.time_profile_id
      metrics_19.parent_ems_cluster_id
      metrics_19.parent_ems_id
      metrics_19.parent_host_id
      metrics_19.parent_storage_id
      metrics_19.time_profile_id
      metrics_20.parent_ems_cluster_id
      metrics_20.parent_ems_id
      metrics_20.parent_host_id
      metrics_20.parent_storage_id
      metrics_20.time_profile_id
      metrics_21.parent_ems_cluster_id
      metrics_21.parent_ems_id
      metrics_21.parent_host_id
      metrics_21.parent_storage_id
      metrics_21.time_profile_id
      metrics_22.parent_ems_cluster_id
      metrics_22.parent_ems_id
      metrics_22.parent_host_id
      metrics_22.parent_storage_id
      metrics_22.time_profile_id
      metrics_23.parent_ems_cluster_id
      metrics_23.parent_ems_id
      metrics_23.parent_host_id
      metrics_23.parent_storage_id
      metrics_23.time_profile_id
      metrics_base.parent_ems_cluster_id
      metrics_base.parent_ems_id
      metrics_base.parent_host_id
      metrics_base.parent_storage_id
      metrics_base.resource_id
      metrics_base.time_profile_id
      miq_ae_classes.domain_id
      miq_ae_instances.domain_id
      miq_ae_methods.domain_id
      miq_ae_namespaces.domain_id
      miq_ae_namespaces.git_repository_id
      miq_ae_namespaces.tenant_id
      miq_alert_statuses.ems_id
      miq_groups.tenant_id
      miq_groups_users.miq_group_id
      miq_queue.group_id
      miq_queue.handler_id
      miq_queue.instance_id
      miq_queue.target_id
      miq_queue.tenant_id
      miq_queue.user_id
      miq_regions.maintenance_zone_id
      miq_reports.user_id
      miq_request_tasks.conversion_host_id
      miq_request_tasks.miq_request_task_id
      miq_request_tasks.tenant_id
      miq_requests.service_order_id
      miq_roles_features.miq_product_feature_id
      miq_schedules.file_depot_id
      miq_schedules.resource_id
      miq_servers.log_file_depot_id
      miq_set_memberships.member_id
      miq_widget_contents.miq_group_id
      miq_widget_shortcuts.miq_shortcut_id
      miq_widget_shortcuts.miq_widget_id
      network_ports.binding_host_id
      network_ports_security_groups.security_group_id
      notifications.cause_id
      notifications.subject_id
      openscap_results.resource_id
      orchestration_stacks.cloud_tenant_id
      orchestration_stacks.configuration_script_base_id
      orchestration_stacks.ems_id
      persistent_volume_claims.container_project_id
      persistent_volume_claims.ems_id
      physical_chassis.ems_id
      physical_chassis.parent_physical_chassis_id
      physical_chassis.physical_rack_id
      physical_network_ports.guest_device_id
      physical_network_ports.switch_id
      physical_racks.ems_id
      physical_servers.ems_id
      physical_servers.physical_chassis_id
      physical_servers.physical_rack_id
      physical_storages.ems_id
      physical_storages.physical_chassis_id
      physical_storages.physical_rack_id
      pictures.resource_id
      providers.tenant_id
      providers.zone_id
      pxe_images.pxe_image_type_id
      pxe_images.pxe_menu_id
      pxe_menus.pxe_server_id
      resource_actions.configuration_template_id
      resource_actions.dialog_id
      resource_actions.resource_id
      resource_groups.ems_id
      san_addresses.owner_id
      scan_histories.task_id
      scan_results.resource_id
      security_contexts.resource_id
      security_groups_vms.security_group_id
      security_groups_vms.vm_id
      service_connections.service_bundle_id
      service_orders.tenant_id
      service_orders.user_id
      service_resources.resource_id
      service_resources.service_id
      service_resources.service_template_id
      service_resources.source_id
      service_template_catalogs.tenant_id
      service_templates.evm_owner_id
      service_templates.miq_group_id
      service_templates.service_template_catalog_id
      service_templates.service_template_id
      service_templates.tenant_id
      service_templates.zone_id
      services.evm_owner_id
      services.miq_group_id
      services.service_template_id
      services.tenant_id
      shares.resource_id
      showback_data_rollups.resource_id
      showback_envelopes.resource_id
      showback_price_plans.resource_id
      storage_profiles.ems_id
      storages_vms_and_templates.storage_id
      subnets.lan_id
      switches.ems_id
      tenant_quotas.tenant_id
      tenants.default_miq_group_id
      tenants.source_id
      vms.cloud_network_id
      vms.cloud_subnet_id
      vms.cloud_tenant_id
      vms.ems_cluster_id
      vms.orchestration_stack_id
      vms.resource_group_id
      vms.storage_profile_id
      windows_images.pxe_image_type_id
      windows_images.pxe_server_id
      zones.log_file_depot_id
    ])
  end

  it "should be included in an index" do
    missing_indexes = []
    no_longer_exceptions = []

    ActiveRecord::Base.connection.tables.sort.each do |table|
      next if ManageIQ::Schema::SYSTEM_TABLES.include?(table)

      indexes = DatabaseHelper.indexes_for_table(table)

      DatabaseHelper.columns_for_table(table).each do |column|
        next unless column.name.end_with?("_id")

        fq_column_name = "#{table}.#{column.name}"
        column_in_index = indexes.any? { |i| i.columns.first == column.name } # This checks for a single column index as well as the start of a multi-column index

        if fq_column_name.in?(exceptions_list)
          no_longer_exceptions << fq_column_name if column_in_index
        else
          missing_indexes << fq_column_name unless column_in_index
        end
      end
    end

    expect(no_longer_exceptions).to be_empty, "Thanks for fixing technical debt!!! Please remove the following foreign key columns from EXCEPTIONS_LIST in #{__FILE__}:\n\n#{no_longer_exceptions.join("\n")}"
    expect(missing_indexes).to be_empty, "Expected the following foreign key columns to be included in an index:\n\n#{missing_indexes.join("\n")}"
  end
end
