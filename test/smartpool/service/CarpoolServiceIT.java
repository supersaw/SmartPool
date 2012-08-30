package smartpool.service;

import org.junit.Test;
import smartpool.domain.Carpool;
import smartpool.persistence.dao.CarpoolDao;
import smartpool.persistence.dao.RouteDao;

import java.util.List;

import static org.junit.Assert.assertEquals;

public class CarpoolServiceIT {
    @Test
    public void shouldGetCarpoolsFromDBWhenSearchByLocation() throws Exception {
        CarpoolService carpoolService = new CarpoolService(new CarpoolDao(), new RouteService(new RouteDao()));
        List<Carpool> allCarpoolsByLocation = carpoolService.findAllCarpoolsByLocation("Diamond District");

        assertEquals("carpool-1", allCarpoolsByLocation.get(0).getName());
    }
}