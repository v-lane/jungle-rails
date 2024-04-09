describe('Add to Cart', () => {

  it('should visit root', () => {
    cy.visit('/');
  });

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("The 'Add to Cart' button is on the page", () => {
    cy.get(".products article").first()
      .get(".button_to").should("be.visible");

  });

  it("The 'Cart' button is on the page", () => {
    cy.get(".navbar .end-0")
  });

  it("The 'Cart' button has a count of zero", () => {
    cy.get(".navbar .end-0").contains("a", "My Cart (0)")
  });

  it("Clicking the 'Add to Cart' button increases count of the 'Cart' button", () => {
    cy.get(".products article").first()
      .get(".button_to").submit()

    cy.get(".navbar .end-0").contains("a", "My Cart (1)")
  });
});