@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Componenti'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_COMPONENTI
  as select from zcomponenti as Componente
  association to parent ZR_BIGLIETTI as _biglietti on _biglietti.IdBiglietto = $projection.IdBiglietto
  association to ZR_SEX              as _sex       on _sex.Sex = Componente.sex
{
  key Componente.id_biglietto as IdBiglietto,
  key Componente.progressivo  as Progressivo,
      Componente.age          as Age,
//      @Consumption.valueHelpDefinition: [{
//        entity: {
//            name: 'ZR_SEX',
//            element: 'Sex' },
//        additionalBinding: [{
//            element: 'Cromosoma',
//            localElement: 'Cromosomax',
//            usage: #RESULT}] }]
//
//      @ObjectModel:{
//          text: {
//              element: ['_sex.Meaning']
//          }
//      }
      Componente.sex          as Sex,
//      _sex.Cromosoma          as Cromosomax,
      @Semantics.user.createdBy: true
      Componente.created_by   as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      Componente.created_at   as CreatedAt,
      @Semantics.user.lastChangedBy: true
      Componente.changed_by   as ChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      Componente.changed_at   as ChangedAt,
      //      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      //      Componente.locallastchanged as Locallastchanged,

      //Associations
      _biglietti,
      _sex
}
