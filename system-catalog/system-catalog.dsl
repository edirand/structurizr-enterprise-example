workspace {
    !identifiers hierarchical

    name "System Catalog"

    model {
        customer = person "Customer"
        assetOrder = softwareSystem "Order System"
        assetInvoice = softwareSystem "Invoice System"
        assetCustomer = softwareSystem "Customer System"
    }

    views {
        styles {
            element "Person" {
                shape person
            }
        }
    }
}