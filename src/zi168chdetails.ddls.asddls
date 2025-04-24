@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for the child details'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi168Chdetails as select from zpcchtable
association to parent zip168details as _parent
    on $projection.Refempid = _parent.Id
{
    key addid as Addid,
    key refempid as Refempid,
    address as Address,
    zipcode as Zipcode,
    country as Country,
    _parent 
}
