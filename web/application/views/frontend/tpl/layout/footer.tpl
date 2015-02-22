[{block name="footer_main"}]
    <footer class="footer-secondary">
        <div class="container">
            <div class="col-sm-6 col-md-3">
                [{oxid_include_widget cl="oxwInformation" noscript=1 nocookie=1}]
            </div>
            <div class="col-sm-6 col-md-3">
                [{oxid_include_widget cl="oxwManufacturerList" _parent=$oView->getClassName() noscript=1 nocookie=1}]
            </div>
            <div class="col-sm-6 col-md-3">
                [{if $oView->showTags()}]
                    [{oxid_include_widget nocookie=1 cl="oxwTagCloud" blShowBox="1" noscript=1}]
                [{/if}]
            </div>
            <div class="col-sm-6 col-md-3">
                [{if $oView->showNewsletter()}]
                    [{include file="widget/footer/newsletter.tpl"}]
                [{else}]
                    [{oxid_include_widget cl="oxwCategoryTree" _parent=$oView->getClassName() sWidgetType="footer" noscript=1 nocookie=1}]
                [{/if}]
            </div>
        </div>
    </footer>
    <footer class="footer-primary">
        <div class="container">
            <div class="col-sm-8">
                [{oxid_include_widget cl="oxwServiceList" noscript=1 nocookie=1}]
                [{oxifcontent ident="oxstdfooter" object="oCont"}]
                    [{$oCont->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            </div>
            <div class="col-sm-4 text-right hidden-xs">
                [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
                    [{if $oView->isVatIncluded()}]
                        <a href="[{$oCont->getLink()}]" rel="nofollow">* [{oxmultilang ident="PLUS_SHIPPING"}] [{oxmultilang ident="PLUS_SHIPPING2"}]</a>
                    [{else}]
                        <a href="[{$oCont->getLink()}]" rel="nofollow">* [{oxmultilang ident="PLUS"}] [{oxmultilang ident="PLUS_SHIPPING2"}]</a>
                    [{/if}]
                [{/oxifcontent}]
            </div>
        </div>
    </footer>
[{/block}]
[{* if $oView->isRootCatChanged()}]
    [{oxscript include="js/widgets/oxmodalpopup.js" priority=10 }]
    [{oxscript add="$( '#scRootCatChanged' ).oxModalPopup({ target: '#scRootCatChanged', openDialog: true});"}]
    <div id="scRootCatChanged" class="popupBox corners FXgradGreyLight glowShadow">
        [{include file="form/privatesales/basketexcl.tpl"}]
    </div>
[{/if *}]
