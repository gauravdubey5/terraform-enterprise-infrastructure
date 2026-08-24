output "load_balancer_id" {

  value = azurerm_lb.lbs.id

}

output "backend_pool_id" {

  value = azurerm_lb_backend_address_pool.backend_address_pools.id

}