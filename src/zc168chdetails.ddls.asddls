@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view for zcp table child'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zc168Chdetails
 as projection on zi168Chdetails
{
    key Addid,
    key Refempid,
    Address,
    Zipcode,
    Country,
    /* Associations */
    _parent:redirected to parent zcp168details
}
