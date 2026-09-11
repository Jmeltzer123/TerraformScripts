resource "aws_s3_bucket" "webiste"{ 
    bucket = "my-example-terraform-state"
}


resource "aws_s3_bucket_website_configuration" "website"{ 
    bucket = aws_s3_bucket.website.id
    

    index_document{ 
        suffix = "index.html"
    }

    error_document{ 
        key = "error.html"
    }
}

resource "aws_s3_object" "index"{ 
    bucket  = aws_s3_bucket.website.id
    key     = "index.html"
    source  = "index.html"
    content_type = "text/html"
}


//Infastructure Layout  -- S3 Bucket, S3 Item Configuration Within my Bucket.