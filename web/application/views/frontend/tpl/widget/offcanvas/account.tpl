<li class="dropdown">
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
        [{oxmultilang ident="ACCOUNT"}] <i class="caret"></i>
    </a>
    <ul class="dropdown-menu navmenu-nav" role="menu">
        [{if $oxcmp_user}]
            [{block name="widget_offcanvas_account_items"}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account" }]">[{oxmultilang ident="MY_ACCOUNT"}]</a></li>
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]">[{oxmultilang ident="MY_ORDER_HISTORY"}]</a></li>
                [{* TODO: Implement item comparison *}]
                [{* if $oViewConf->getShowCompareList()}]
                    <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow"><span>[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]</span>[{ if $oView->getCompareItemsCnt() }]<span class="counter FXgradOrange">[{ $oView->getCompareItemsCnt() }]</span>[{/if}]</a></li>
                    [{if $oView->getCompareItemsCnt()}]
                        [{oxscript include='js/widgets/oxcomparelinks.js'}]
                        [{oxscript add="$(function(){oxCompareLinks.updateLinks("|cat:$oView->getCompareItems(true)|cat:");});"}]
                    [{/if}]
                [{/if *}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]">[{oxmultilang ident="MY_WISH_LIST"}][{if $oxcmp_user->getNoticeListArtCnt()}] <span class="badge">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]</a></li>
                [{if $oViewConf->getShowWishlist()}]
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]">[{oxmultilang ident="MY_GIFT_REGISTRY"}][{if $oxcmp_user->getWishListArtCnt()}] <span class="badge">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]</a></li>
                [{/if}]
                [{if $oViewConf->getShowListmania()}]
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]">[{oxmultilang ident="MY_LISTMANIA"}][{if $oxcmp_user->getRecommListsCount()}] <span class="badge">[{$oxcmp_user->getRecommListsCount()}]</span>[{/if}]</a></li>
                [{/if}]
                [{if $oViewConf->isFunctionalityEnabled("blEnableDownloads")}]
                    <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]">[{oxmultilang ident="MY_DOWNLOADS"}]</a></li>
                [{/if}]
            [{/block}]
        [{else}]
            [{block name="widget_offcanvas_offline_account_items"}]
                <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]">[{oxmultilang ident="LOGIN"}]</a></li>
                <li><a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]">[{oxmultilang ident="REGISTER"}]</a></li>
            [{/block}]
        [{/if}]
    </ul>
</li>
