<jsp:include page="../navbar.jsp" flush="true">
    <jsp:param name="css" value="joinRequest.css"/>
    <jsp:param name="title" value="Join SmartPool: ${carpoolName}"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="container">
    <h1>Join CarPool: ${carpoolName}</h1>

    <c:if test="${isRequestSent}">
    <span class="warning">You have already sent the request for this carpool</span>
    </c:if>
    <style>
        .error {
            color: #ff0000;
            font-size: smaller;
        }
    </style>
    <c:if test="${!isRequestSent}">
    <form:form commandName="joinRequestForm" htmlEscape="true">
    <div align="center" style="color: red">
        <spring:hasBindErrors name="joinRequestForm">
            <spring:message code="errors.exist"/>
        </spring:hasBindErrors>
    </div>
    <div class="mainContainer">
            <span>
                <label>Name*</label>
                ${buddy.getName()}
            </span>

            <span>
                <label>Landmark*</label>
                <textarea placeholder="Example: Diamond District Gate No:8" id="addressTextBox" name="address" rows="5" cols="30"
                          style="margin-top: -13px">${joinRequestForm.address}</textarea> <br/>
                <form:errors path="address" cssClass="error"/>
            </span>

            <span>
                <label>Contact Number*</label>
                <input id="contactNumberTextBox" name="contactNumber" type="textbox"
                       value="${joinRequestForm.contactNumber}"/>
                 <form:errors path="contactNumber" cssClass="error"/>
            </span>

            <span>
                <label>Email*</label>
                ${buddy.getEmailId()}
            </span>

            <span>
                <label>Preferred Pick Up Point*</label>
                <input id="pickupPointTextBox" name="pickupPoint" type="textbox"
                       value="${joinRequestForm.pickupPoint}"/>
                <form:errors path="pickupPoint" cssClass="error"/>

            </span>
            <span>
                <label>Pick Up Time (hh:mm)</label>
                <input placeholder="Example: 09:00" id="pickupTimeTextBox" name="preferredPickupTime" type="textbox"
                       value="${joinRequestForm.preferredPickupTime}"/>
                <form:errors path="preferredPickupTime" cssClass="error"/>
            </span>

        <div class="buttonContainer">
            <c:set var="isDisabled" value="${isRequestSent ? 'disabled' : ''}"/>
            <button id="submitFormButton" name="submit" type="submit" ${isDisabled}>Submit</button>
            <button type="button" value="Cancel"
                    onclick="location.href = '${pageContext.request.contextPath}/carpool/${carpoolName}'">Cancel
            </button>
        </div>
    </div>
    </form:form>
    </c:if>

    <%@ include file="../footer.jsp" %>
