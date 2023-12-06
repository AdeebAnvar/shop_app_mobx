String readSingleProducts =
    """query products(\$pageSize: Int!, \$page: Int!, \$filter: ProductAttributeFilterInput!, \$searchQuery: String) {
  products(search: \$searchQuery, filter: \$filter, pageSize: \$pageSize, currentPage: \$page) {
    aggregations(
      filter: {
        category: {
          includeDirectChildrenOnly: true
        }
      }
    ) {
      attribute_code
      count
      label
      options {
        label
        value
        count
      }
    }
    items {
        # additional_info{
        #   label
        #   value
        # }
        name
        sku
        url_key
        url_suffix
        image{
          url
        }
        rating_summary
        review_count
        stock_status
        
        categories{
          name
          uid
          path
        }
        ... on PhysicalProductInterface{
          weight
        }
        # wishlistData{
        #   wishlistItem
        # }
        description {
          html
        }
        short_description	{
          html
        }
        __typename
        special_price
        price_range{
          minimum_price{
            regular_price{
              value
              currency
            }
          }
          maximum_price {
            regular_price {
              value
              currency
            }
            discount {
                amount_off
                percent_off
            }
          }
        }
        # productLabel{
        #   items {
        #     customers_group_ids
        #     end_date
        #     image
        #     image_data
        #     label_text
        #     label_text_data
        #     labelname
        #     priority
        #     productlabel_id
        #     start_date
        #     status
        #     store_ids
        #   }
        #   totalCount
        # }
        # ruleLabel {
        #   items {
        #     display_category
        #     display_product
        #     label_image
        #     rule_id
        #   }
        # }
        # product_inventory{
        #   enable_qty_increments
        #   is_qty_decimal
        #   max_sale_qty
        #   min_sale_qty
        #   qty_increments
        # }
        categories {
          id
        }
        ... on ConfigurableProduct {
          configurable_options {
            id
            attribute_id_v2
            label
            position
            use_default
            attribute_code
            values {
              uid
              value_index
              label
              swatch_data{
                value 
              }
            }
            product_id
          }
          variants {
            product {
              id
              name
              sku
              attribute_set_id
              media_gallery {
                url
                label
              }
              ... on PhysicalProductInterface {
                weight
              }

              price_range{
                minimum_price{
                  regular_price{
                    value
                    currency
                  }
                }
                 maximum_price {
                   regular_price {
                      value
                      currency
                    }
                  discount {
                      amount_off
                      percent_off
                  }
                }
              }
            }
            attributes {
              uid
              label
              code
              value_index
            }
          }
        }
        media_gallery {
            url
            label
            ... on ProductVideo {
                video_content {
                    media_type
                    video_provider
                    video_url
                    video_title
                    video_description
                    video_metadata
                }
            }
        }
        related_products{
          name
          sku      
          url_key
          url_suffix
          image{
            url
          }
          rating_summary
          review_count
          stock_status
          
          categories{
            name
            uid
            path
          }
          price_range{
            minimum_price{
              regular_price{
                value
                currency
              }
            }
            maximum_price {
              regular_price {
                value
                currency
              }
              discount {
                  amount_off
                  percent_off
              }
            }
          }
          # product_inventory{
          #   enable_qty_increments
          #   is_qty_decimal
          #   max_sale_qty
          #   min_sale_qty
          #   qty_increments
          # }
        }
      }
      sort_fields {
        default
        options{
          label
          value
        }
      }
      page_info {
        current_page
        page_size
        total_pages
      }
    }
  }
  
  """;

String addToCartQuery =
    """mutation addProductsToCart(\$cartIdString: String!,\$cartItemsMap:[CartItemInput!]!){
    addProductsToCart(
     cartId: \$cartIdString
     cartItems: \$cartItemsMap
  ) {
    cart {
      items {
        id
        product {
          name
          sku
          url_key
          url_suffix
          image{
            url
          }
          stock_status
          special_price
          price_range{
            minimum_price{
              regular_price{
                value
                currency
              }
            }
            maximum_price {
              regular_price {
                value
                currency
              }
              discount {
                  amount_off
                  percent_off
              }
            }
          }
        }
        quantity
      }
      
      total_quantity
    }
    user_errors {
      code
      message
    }
  }
  }""";
