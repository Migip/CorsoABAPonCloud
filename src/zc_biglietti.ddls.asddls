@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZBIGLIETTI'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_BIGLIETTI
  provider contract transactional_query
  as projection on ZR_BIGLIETTI
  association [1..1] to ZR_BIGLIETTI as _BaseEntity on $projection.IdBiglietto = _BaseEntity.IdBiglietto
  
{
  key IdBiglietto,
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
      Locallastchanged,
      _BaseEntity,
      _componenti: redirected to composition child ZC_COMPONENTI
}
