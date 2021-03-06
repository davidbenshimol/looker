
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
connection: "aws_redshift"

include: "*.view.lkml"         # include all views in this project


#explore: agg_web_general {}
#explore: agg_app_general {}
explore: web_general {}
explore: app_general {}

explore: web_daily_usage {}
explore: app_daily_usage {}
