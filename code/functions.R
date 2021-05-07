#important

#Tabulate Living Children by know about mal vaccine and accept mal vaccine for child
ft3<- flextable(women_svy%>%
                  group_by(v024,Allow_mal_vaccine)%>%
                  summarise(Percentage=round(survey_mean(),4)*100)%>%
                  pivot_wider(names_from = Allow_mal_vaccine, values_from=Percentage))

#good way to get svy:tab
svymean(~Age, women_svy)
