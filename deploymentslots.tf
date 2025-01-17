resource "azurerm_windows_web_app_slot" "example" {
  name           = "staging"
  app_service_id = azurerm_windows_web_app.companyapp100.id

  site_config {
    application_stack {
      current_stack = "dotnet"
      dotnet_version = "v6.0"
    }
  }

  depends_on = [ azurerm_service_plan.companyplan ]
}

resource "azurerm_web_app_active_slot" "staging" {
  slot_id = azurerm_windows_web_app_slot.example.id

}