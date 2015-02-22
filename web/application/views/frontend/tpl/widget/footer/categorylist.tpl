[{if $oxcmp_categories}]
    [{block name="footer_categories"}]
        <h3>[{oxmultilang ident="CATEGORIES"}]</h3>
        <ul>
            [{foreach from=$oxcmp_categories item=category}]
                [{if $category->getIsVisible()}]
                    [{if $category->getContentCats()}]
                        [{foreach from=$category->getContentCats() item=content}]
                            <li><a href="[{$content->getLink()}]">[{$content->oxcontents__oxtitle->value}]</a></li>
                        [{/foreach}]
                    [{/if}]
                    <li><a href="[{$category->getLink()}]">[{$category->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($category->getNrOfArticles() > 0)}] ([{$category->getNrOfArticles()}])[{/if}]</a></li>
                [{/if}]
            [{/foreach}]
        </ul>
    [{/block}]
[{/if}]
