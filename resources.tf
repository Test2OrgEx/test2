data "azurerm_resource_group" "localrg" {
  name = "FirstRG"

}
resource "azurerm_service_plan" "appplan" {
  name                = "${var.teamname}-${var.planname}"
  resource_group_name = data.azurerm_resource_group.localrg.name
  location            = data.azurerm_resource_group.localrg.location
  sku_name            = "S1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "localappication" {
  name                = "${var.teamname}${var.sitename}abcxy000${var.regioncode}"
  resource_group_name = data.azurerm_resource_group.localrg.name
  location            = data.azurerm_resource_group.localrg.location
  service_plan_id     = azurerm_service_plan.appplan.id

  site_config {}
}