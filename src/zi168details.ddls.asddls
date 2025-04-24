@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for the zpc table'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi168details as select from ZPCTABLE
{
    key id as Id,
    name as Name,
    age as Age
}
