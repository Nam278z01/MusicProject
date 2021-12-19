using System.Web;
using System.Web.Optimization;

namespace MusicProject
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/assets/css").Include(
                      "~/assets/css/base.css",
                       "~/assets/css/grid.css",
                       "~/assets/css/sidebar.css",
                       "~/assets/css/playmusic.css",
                       "~/assets/css/navAptAofooter.css",
                       "~/assets/css/gridmusic.css",
                       "~/assets/css/detail.css",
                       "~/assets/css/loadAmodal.css",
                       "~/assets/css/playmusic.css",
                       "~/assets/css/main.css",
                       "~/assets/css/responsive.css"));
            bundles.Add(new StyleBundle("~/mana/assets/css").Include(
                      "~/Areas/Admin/assets/template/vendors/feather/feather.css",
                       "~/Areas/Admin/assets/template/vendors/mdi/css/materialdesignicons.min.css",
                       "~/Areas/Admin/assets/template/vendors/ti-icons/css/themify-icons.css",
                       "~/Areas/Admin/assets/template/vendors/typicons/typicons.css",
                       "~/Areas/Admin/assets/template/vendors/simple-line-icons/css/simple-line-icons.css",
                       "~/Areas/Admin/assets/template/vendors/css/vendor.bundle.base.css",
                       "~/Areas/Admin/assets/template/js/select.dataTables.min.css",
                       "~/Areas/Admin/assets/template/css/vertical-layout-light/style.css"));
            bundles.Add(new ScriptBundle("~/Scripts/js").Include(
                       "~/Scripts/CustomerController/app.js",
                       "~/Scripts/CustomerController/collection.controller.js",
                       "~/Scripts/CustomerController/detail.controller.js",
                       "~/Scripts/CustomerController/discovery.controller.js",
                       "~/Scripts/CustomerController/home.controller.js",
                       "~/Scripts/CustomerController/liked.controller.js",
                       "~/Scripts/CustomerController/listened.controller.js",
                       "~/Scripts/CustomerController/loginAsignup.controller.js",
                       "~/Scripts/CustomerController/myplaylist.controller.js",
                       "~/Scripts/CustomerController/playmusic.controller.js",
                       "~/Scripts/CustomerController/rank.controller.js",
                       "~/Scripts/CustomerController/search.controller.js",
                       "~/Scripts/CustomerController/sidebar.controller.js",
                       "~/Scripts/CustomerController/slide.controller.js",
                       "~/Scripts/CustomerController/top100.controller.js"));
            bundles.Add(new ScriptBundle("~/mana/Scripts/js").Include(
                       "~/Areas/Admin/assets/template/vendors/js/vendor.bundle.base.js",
                       "~/Areas/Admin/assets/template/vendors/chart.js/Chart.min.js",
                       "~/Areas/Admin/assets/template/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js",
                       "~/Areas/Admin/assets/template/vendors/progressbar.js/progressbar.min.js",
                       "~/Areas/Admin/assets/template/js/template.js",
                       "~/Areas/Admin/assets/template/js/settings.js",
                       "~/Areas/Admin/assets/template/js/dashboard.js",//Custom (2 dòng cuối)
                       "~/Areas/Admin/assets/template/js/Chart.roundedBarCharts.js"));
        }
    }
}
