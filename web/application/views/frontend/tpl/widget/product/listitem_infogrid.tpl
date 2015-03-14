[{assign var="product" value=$oView->getProduct()}]
<div class="col-lg-3">
    <img src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
</div>
