@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection ZR_COMPONENTI'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZC_COMPONENTI
  as projection on ZR_COMPONENTI
{
  key IdBiglietto,
  key Progressivo,
      Age,
      @Consumption.valueHelpDefinition: [{
        entity: {
            name: 'ZR_SEX',
            element: 'Sex' },
        additionalBinding: [{
            element: 'Cromosoma',
            localElement: 'Cromosomax',
            usage: #RESULT}] }]

      @ObjectModel:{
          text: {
              element: ['Meaning']
          }
      }
      Sex,
      _sex.Meaning          as Meaning,
      _sex.Cromosoma          as Cromosomax,
      @Semantics: {
        user.createdBy: true
      }
      CreatedBy,
      @Semantics: {
        systemDateTime.createdAt: true
      }
      CreatedAt,
      @Semantics: {
        user.lastChangedBy: true
      }
      ChangedBy,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      ChangedAt,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
//      Locallastchanged,
      _biglietti: redirected to parent ZC_BIGLIETTI
}
