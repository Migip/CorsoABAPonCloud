@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZBIGLIETTI'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_BIGLIETTI
  as select from zbiglietti as Biglietto
  composition [0..*] of ZR_COMPONENTI as _componenti
{
  key Biglietto.id_biglietto     as IdBiglietto,
      @Semantics.user.createdBy: true
      Biglietto.created_by       as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      Biglietto.created_at       as CreatedAt,
      @Semantics.user.lastChangedBy: true
      Biglietto.changed_by       as ChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      Biglietto.changed_at       as ChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      Biglietto.locallastchanged as Locallastchanged,

      //Associations
      _componenti
}
