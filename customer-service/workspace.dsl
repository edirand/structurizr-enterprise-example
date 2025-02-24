workspace extends http://structurizr:8080/share/1/4d9e4fa2-3b78-4383-8c8e-7ed433b2db6f/dsl {

    name "Customer System"

    model {
        !element assetCustomer {
            api = container "Customer API"
            database = container "Customer Database"

            api -> database "Reads from and writes to"
        }
    }

    views {
        systemContext assetCustomer "SystemContext" {
            include *
            autolayout lr
        }

        container assetCustomer "Containers" {
            include *
            autolayout lr
        }
    }

    configuration {
        scope softwaresystem
    }
}