@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sex'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel:
{
    resultSet:{
        sizeCategory: #XS
    }
}
define view entity ZR_SEX as select from zsex
{
    @ObjectModel:{
        text: {
            element: ['Meaning']
        }
    }
    key sex as Sex,
    meaning as Meaning,
    cromosoma as Cromosoma
}
