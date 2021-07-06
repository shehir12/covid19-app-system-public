locals {
  table_name = "${terraform.workspace}_analytics_google_installs_overview_report"
}

resource "aws_glue_catalog_table" "this" {
  name          = local.table_name
  database_name = var.database_name

  storage_descriptor {
    location      = "s3://${terraform.workspace}-analytics-google-installs-overview-report/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      name                  = "csv"
      serialization_library = "org.apache.hadoop.hive.serde2.OpenCSVSerde"

      parameters = {
        "separatorChar"          = ","
        "skip.header.line.count" = "1"
      }
    }

    columns {
      name = "date"
      type = "string"
    }

    columns {
      name = "package_name"
      type = "string"
    }

    columns {
      name = "daily_device_installs"
      type = "int"
    }

    columns {
      name = "daily_device_uninstalls"
      type = "int"
    }

    columns {
      name = "daily_device_upgrades"
      type = "int"
    }

    columns {
      name = "total_user_installs"
      type = "int"
    }

    columns {
      name = "daily_user_installs"
      type = "int"
    }

    columns {
      name = "daily_user_uninstalls"
      type = "int"
    }

    columns {
      name = "active_device_installs"
      type = "int"
    }

    columns {
      name = "install_events"
      type = "int"
    }

    columns {
      name = "update_events"
      type = "int"
    }

    columns {
      name = "uninstall_events"
      type = "int"
    }
  }
}
