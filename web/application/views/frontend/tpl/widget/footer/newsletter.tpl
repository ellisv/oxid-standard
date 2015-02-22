<h3>[{oxmultilang ident="NEWSLETTER"}]</h3>
<form action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="fnc" value="fill">
    <input type="hidden" name="cl" value="newsletter">
    [{if $oView->getProduct()}]
        [{assign var="product" value=$oView->getProduct()}]
        <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
    [{/if}]
    <div class="form-group">
        <label for="newsletter-signup-email" class="sr-only">[{oxmultilang ident="EMAIL"}]</label>
        <input id="newsletter-signup-email" type="email" name="editval[oxuser__oxusername]" placeholder="[{oxmultilang ident="EMAIL"}]" class="form-control">
    </div>
    <button class="btn btn-default btn-lg" type="submit">[{oxmultilang ident="SUBSCRIBE"}]</button>
</form>
