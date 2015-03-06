[{assign var="banners" value=$oView->getBanners()}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{if $banners|@count}]
    [{* TODO: Implement carousel slider for tablet and mobile versions as well *}]
    <div id="promoslider" class="carousel slide visible-lg-block" data-ride="carousel">
        <ol class="carousel-indicators">
            [{assign var="bannerCount" value=$banners|@count}]
            [{assign var="bannerCount" value=$bannerCount-1}]
            [{foreach name=bannerIdLoop item=i from=0|@range:$bannerCount}]
                <li data-target="#promoslider" data-slide-to="[{$i}]"[{if $smarty.foreach.bannerIdLoop.first}] class="active"[{/if}]></li>
            [{/foreach}]
        </ol>

        <div class="carousel-inner" role="listbox">
            [{foreach from=$banners item=banner name=bannerLoop}]
                [{assign var="product" value=$banner->getBannerArticle()}]
                [{assign var="link" value=$banner->getBannerLink()}]
                [{assign var="pictureUrl" value=$banner->getBannerPictureUrl()}]
                <div class="item[{if $smarty.foreach.bannerLoop.first}] active[{/if}]">
                    [{if $link}]
                        <a href="[{$link}]">
                    [{/if}]
                    [{if $pictureUrl}]
                        <img src="[{$pictureUrl}]" alt="[{$banner->oxactions__oxtitle->value}]">
                    [{/if}]
                    [{if $product}]
                        <div class="carousel-caption">
                            [{* TODO: Make caption prettier *}]
                            [{assign var="from" value=""}]
                            [{assign var="price" value=$product->getPrice()}]
                            [{if $product->isParentNotBuyable()}]
                                [{assign var="price" value=$product->getVarMinPrice()}]
                                [{if $product->isRangePrice()}]
                                    [{assign var="from" value="PRICE_FROM"|oxmultilangassign}]
                                [{/if}]
                            [{/if}]
                            <h3>[{$product->oxarticles__oxtitle->value}]</h3>
                            <p>[{$from}] [{oxprice price=$price currency=$currency}]</p>
                        </div>
                    [{/if}]
                    [{if $link}]
                        </a>
                    [{/if}]
                </div>
            [{/foreach}]
        </div>

        <a class="left carousel-control" href="#promoslider" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">[{oxmultilang ident="PREVIOUS"}]</span>
        </a>
        <a class="right carousel-control" href="#promoslider" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">[{oxmultilang ident="NEXT"}]</span>
        </a>
    </div>
[{/if}]
