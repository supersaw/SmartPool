package smartpool.service;

import org.springframework.stereotype.Service;
import smartpool.domain.Carpool;

@Service
public class CarpoolService {
    public Carpool findCarpoolBy(String name) {
        if ("carpool-1".equals(name)){
            return CarpoolBuilder.CARPOOL_1;
        }
        return null;
    }

    public Carpool findCarpoolByLocation(String location) {
        return null;
    }
}
