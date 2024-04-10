describe('User Login', () => {

  it('should visit root', () => {
    cy.visit('/');
  });

  it('The login button is on the page', () => {
    cy.get(".navbar").contains("li", "Login").should('exist')
  })

  it('The register button is on the page', () => {
    cy.get(".navbar").contains("li", "Register").should('exist')
  })

  it('The logout button is not on the page', () => {
    cy.get(".navbar").contains("li", "Logout").should('not.exist')
  })

  it('Clicking the login button loads the login page', () => {
    cy.get(".navbar").contains("li", "Profile").click()
    cy.get(".navbar").contains("li", "Login").click()

    cy.get(".sessions-new").contains(".page-header", "Login").should('exist')
  })

  it('Clicking the register button loads the registration page', () => {
    cy.get(".navbar").contains("li", "Profile").click()
    cy.get(".navbar").contains("li", "Register").click()

    cy.get(".users-new").contains(".page-header", "Register").should('exist')
  })

  it('The registeration form creates a new user and logs in user', () => {
    cy.get(".navbar").contains("li", "Profile").click()
    cy.get(".navbar").contains("li", "Register").click()

    cy.get(".users-new").contains(".page-header", "Register")

    cy.get("form").contains("label", "First name")
      .parent().find("input")
      .clear().type("Lydia")

    cy.get("form").contains("label", "Last name")
      .parent().find("input")
      .clear().type("Miller")
      
    cy.get("form").contains("label", "Email")
      .parent().find("input")
      .clear().type("lymiller@example.com")

    cy.get("form").contains("label", "Password")
      .parent().find("input")
      .clear().type("password")

    cy.get("form").contains("label", "Password confirmation")
      .parent().find("input")
      .clear().type("password")

    cy.get("form").submit()

    cy.get(".products article").should("be.visible");
    cy.get(".products article").should("have.length", 2);

    cy.get(".navbar").contains("li", "Login").should('not.exist')
    cy.get(".navbar").contains("li", "Register").should('not.exist')
    cy.get(".navbar").contains("li", "Logout").should('exist')
    cy.get(".navbar").contains("li", "Lydia").should('exist')
  })

  it('The login form logs in an existing user', () => {
    cy.get(".navbar").contains("li", "Lydia").click()
    cy.get(".navbar").contains("li", "Logout").click()
    
    cy.get(".navbar").contains("li", "Lydia").should('not.exist')
    cy.get(".navbar").contains("li", "Profile").click()
    cy.get(".navbar").contains("li", "Login").click()

    cy.get("form").contains("label", "Email")
    .parent().find("input")
    .clear().type("lymiller@example.com")

    cy.get("form").contains("label", "Password")
    .parent().find("input")
    .clear().type("password")

    cy.get("form").submit()

    cy.get(".products article").should("be.visible");
    cy.get(".products article").should("have.length", 2);

    cy.get(".navbar").contains("li", "Login").should('not.exist')
    cy.get(".navbar").contains("li", "Register").should('not.exist')
    cy.get(".navbar").contains("li", "Logout").should('exist')
    cy.get(".navbar").contains("li", "Lydia").should('exist')
  })

})