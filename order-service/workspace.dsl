workspace extends http://structurizr:8080/share/1/4d9e4fa2-3b78-4383-8c8e-7ed433b2db6f/dsl {

    name "Order service"

    model {
        !element assetOrder {
            webapp = container "Orders UI"
            database = container "Orders Database"

            customer -> webapp "Makes orders using"
            webapp -> assetCustomer "Manages customer data using" "JSON/HTTPS"
            webapp -> database "Reads from and writes to"
        }
    }

    views {
        systemContext assetOrder "SystemContext" {
            include *
            autolayout lr
        }

        container assetOrder "Containers" {
            include *
            autolayout lr
        }
    }

    configuration {
        scope softwaresystem
    }
}