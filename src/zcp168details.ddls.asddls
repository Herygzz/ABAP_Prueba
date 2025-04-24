@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'consumption view for zcp table parent'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zcp168details
  provider contract transactional_query
  as projection on zip168details
{
      @EndUserText.label: 'Emp Id'
  key Id,
      @EndUserText.label: 'Emp Name'
      //      @Consumption.valueHelpDefinition: [{ entity : { name: 'zc168details', element: 'Name' } }]
      Name,

      @EndUserText.label: 'Age'

      Age,
      /* Associations */
      _child : redirected to composition child zc168Chdetails
}
