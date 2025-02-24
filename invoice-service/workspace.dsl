workspace extends http://structurizr:8080/share/1/4d9e4fa2-3b78-4383-8c8e-7ed433b2db6f/dsl {
    name "Invoice System"

    model {
        !element assetInvoice {
            ui = container "Invoice UI"
            s3 = container "Invoice Store" {
                technology "Amazon Web Service S3 Bucket"
            }

            ui -> s3 "Stores and retrieves invoices from" "HTTPS"
        }

        customer -> ui "Downloads invoices from"
        ui -> assetCustomer "Gets customer data from" "JSON/HTTPS"
    }

    views {
        systemContext assetInvoice "SystemContext" {
            include *
            autolayout lr
        }

        container assetInvoice "Containers" {
            include *
            autolayout lr
        }
    }

    configuration {
        scope softwaresystem
    }
}