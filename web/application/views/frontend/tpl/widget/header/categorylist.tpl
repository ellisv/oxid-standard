[{assign var="count" value=0}]
[{assign var="showMore" value=false}]
<ul class="nav nav-pills nav-lg">
    [{foreach from=$oxcmp_categories item=category}]
        [{if $category->getIsVisible()}]
            [{foreach from=$category->getContentCats() item=content}]
                [{if $count < $oView->getTopNavigationCatCnt()}]
                    <li><a href="[{$content->getLink()}]">[{$content->oxcontents__oxtitle->value}]</a></li>
                [{else}]
                    [{assign var="showMore" value=true}]
                    [{capture append="moreLinks"}]
                        <li><a href="[{$content->getLink()}]">[{$content->oxcontents__oxtitle->value}]</a></li>
                    [{/capture}]
                [{/if}]
                [{assign var="count" value=$count+1}]
            [{/foreach}]

            [{if $count < $oView->getTopNavigationCatCnt()}]
                <li[{if $category->expanded}] class="active"[{/if}]>
                    [{assign var="subCategories" value=$category->getSubCats()}]
                    <a href="[{$category->getLink()}]"[{if $subCategories}] class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"[{/if}]>
                        [{$category->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0) }] ([{$category->getNrOfArticles()}])[{/if}][{if $category->expanded}] <span class="sr-only">([{oxmultilang ident="CURRENT"}])</span>[{/if}][{if $subCategories}] <i class="caret"></i>[{/if}]
                    </a>
                    [{if $subCategories}]
                        <ul class="dropdown-menu" role="menu">
                            [{foreach from=$category->getSubCats() item=subCategory}]
                                [{if $subCategory->getIsVisible()}]
                                    [{foreach from=$subCategory->getContentCats() item=content}]
                                        <li><a href="[{$content->getLink()}]">[{$content->oxcontents__oxtitle->value}]</a></li>
                                    [{/foreach}]
                                    [{if $subCategory->getIsVisible()}]
                                        <li[{if $subCategory->expanded}] class="active"[{/if}]><a href="[{$subCategory->getLink()}]">[{$subCategory->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($subCategory->getNrOfArticles() > 0)}] ([{$subCategory->getNrOfArticles()}])[{/if}]</a></li>
                                    [{/if}]
                                [{/if}]
                            [{/foreach}]
                        </ul>
                    [{/if}]
                </li>
            [{else}]
                [{assign var="showMore" value=true}]
                [{capture append="moreLinks"}]
                    <li[{if $category->expanded}] class="active"[{/if}]>
                        <a href="[{$category->getLink()}]">[{$category->oxcategories__oxtitle->value}][{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]</a>
                    </li>
                [{/capture}]
            [{/if}]
            [{assign var="count" value=$count+1}]
        [{/if}]
    [{/foreach}]
    [{if $showMore}]
        <li class="dropdown">
            <a href="[{oxgetseourl ident=$oView->getCatMoreUrl()|cat:"&cl=alist"}]" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                [{oxmultilang ident="MORE"}] <i class="caret"></i>
            </a>
            <ul class="dropdown-menu" role="menu">
                [{foreach from=$moreLinks item=link}]
                    [{$link}]
                [{/foreach}]
            </ul>
        </li>
    [{/if}]
</ul>
