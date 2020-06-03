get_my_stats = function(input, k = 100000){
  ## requer agrupamento por cidade/estado/etc
  input %>%
    mutate(CFR         = round(deaths/confirmed*100, 2),
           cases100k   = round(confirmed/estimated_population_2019*k, 2),
           deaths100k  = round(deaths/estimated_population_2019*k, 2),
           daily_cases = confirmed - lag(confirmed, n=1, default=0))
}

get_data = function(input, this_state="SP", RMC, COI, SOI){
  dados_sp = input %>% filter(state == this_state)
  
  dados_cid_RMC = dados_sp %>% semi_join(RMC, by='city_ibge_code') %>% 
    mutate(place_type = "city_rmc")
  
  dados_reg_RMC = dados_cid_RMC %>% group_by(date) %>%
    summarise(state="SP", city="RMC", place_type="region_rmc", confirmed=sum(confirmed),
              deaths=sum(deaths), is_last=FALSE, estimated_population_2019=3224443,
              city_ibge_code=NA, confirmed_per_100k_inhabitants=NA, death_rate=NA) %>% 
    ungroup() %>% arrange(date)
  dados_reg_RMC$is_last[nrow(dados_reg_RMC)] = TRUE
  
  dados_cid_COI = dados_sp %>% semi_join(COI, by='city_ibge_code') %>% 
    mutate(place_type = "city_coi")
  
  dados_reg_RMCCOI = dados_reg_RMC %>% bind_rows(dados_cid_COI) %>% group_by(date) %>%
    summarise(state="SP", city="RMC + Limeira + Piracicaba",
              place_type="region_rmccoi", confirmed=sum(confirmed),
              deaths=sum(deaths), is_last=FALSE, estimated_population_2019=3224443+306114+404142,
              city_ibge_code=NA, confirmed_per_100k_inhabitants=NA, death_rate=NA) %>% 
    ungroup() %>% arrange(date)
  dados_reg_RMCCOI$is_last[nrow(dados_reg_RMCCOI)] = TRUE
  
  dados_est_SP  = dados_sp %>% filter(place_type == "state") %>% 
    mutate(city="SP (Estado)")
  
  dados_cid_RMC %>% bind_rows(dados_cid_COI) %>% bind_rows(dados_reg_RMC) %>%
    bind_rows(dados_reg_RMCCOI) %>% bind_rows(dados_est_SP) %>% 
    select(-confirmed_per_100k_inhabitants, -death_rate) %>%
    group_by(city) %>% 
    arrange(date) %>% 
    get_my_stats() %>% 
    ungroup()
}

library(datacovidbr)
brdata = brasilio(cache=TRUE)

RMC = tibble(city = c("Americana", "Artur Nogueira", "Campinas", "Cosmópolis", "Engenheiro Coelho",
                      "Holambra", "Hortolândia", "Indaiatuba", "Itatiba", "Jaguariúna",
                      "Monte Mor", "Morungaba", "Nova Odessa", "Paulínia", "Pedreira",
                      "Santa Bárbara D'oeste", "Santo Antônio De Posse", "Sumaré",
                      "Valinhos", "Vinhedo"),
             city_ibge_code= c(3501608, 3503802, 3509502, 3512803, 3515152,
                               3519055, 3519071, 3520509, 3523404, 3524709,
                               3531803, 3532009, 3533403, 3536505, 3537107,
                               3545803, 3548005, 3552403,
                               3556206, 3556701))

COI = tibble(city = c("Piracicaba", "Limeira"), city_ibge_code = c(3538709, 3526902))

spdata = brdata %>% get_data("SP", RMC, COI, SOI)

spdata = spdata %>%
  select(-state, -is_last, -city_ibge_code, -CFR, -cases100k, -deaths100k, -daily_cases)

jundiaidata = brdata %>%
  filter(city == "Jundiaí", state == "SP") %>% 
  select(date, city, place_type, confirmed, deaths, estimated_population_2019) %>% 
  arrange(date)
spdata = spdata %>% bind_rows(jundiaidata)
save(spdata, file="spdata.rda")


