package smartpool.web.form;

import org.joda.time.LocalTime;
import org.junit.Test;
import smartpool.domain.JoinRequest;

import static org.junit.Assert.assertThat;
import static smartpool.util.matchers.ReflectionMatcher.reflectionEquals;

public class JoinRequestFormTest {
    @Test
    public void shouldCreateValidDomainObject() throws Exception {
        JoinRequest joinRequest = new JoinRequestForm("test.twu", "test carpool", "Diamond District, Gate 8", "+91 9999 999 999", "Gate 8", "8:30").createDomainObject();
        assertThat(joinRequest, reflectionEquals(new JoinRequest("test.twu", "test carpool","Diamond District, Gate 8","Gate 8", new LocalTime(8, 30))));
    }

    @Test
    public void shouldCreateValidDomainObjectIfPreferredTimeHasNoZeroPadding() throws Exception {
        JoinRequest joinRequest = new JoinRequestForm("test.twu", "test carpool", "Diamond District, Gate 8", "+91 9999 999 999", "Gate 8", "8:30").createDomainObject();
        assertThat(joinRequest, reflectionEquals(new JoinRequest("test.twu", "test carpool", "Diamond District, Gate 8", "Gate 8", new LocalTime(8, 30))));
    }
}
