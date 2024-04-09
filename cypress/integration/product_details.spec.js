describe('Product Details Page', () => {

  it('should visit root', () => {
    cy.visit('/')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it('should navigate to product details page', () => {
    cy.get('[alt="Scented Blade"]')
    .click()

    cy.get(".products-show").should('be.visible')
  })
})