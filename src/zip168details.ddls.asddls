@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for the parent'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zip168details as select from zpctable
composition[1..*] of zi168Chdetails  as _child
{
    key id as Id,
    name as Name,
    age as Age,
    _child
}
