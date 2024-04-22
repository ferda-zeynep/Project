<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Match the root element -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Recipe Catalog</title>
      </head>
      <body>
        <!-- Apply templates for each Continent -->
        <xsl:apply-templates select="Catalog/Continent"/>
      </body>
    </html>
  </xsl:template>

  <!-- Template to match each Continent element -->
  <xsl:template match="Continent">
    <h1><xsl:value-of select="@name"/></h1>
    <!-- Apply templates for each Country -->
    <xsl:apply-templates select="Country"/>
  </xsl:template>

  <!-- Template to match each Country element -->
  <xsl:template match="Country">
    <h2><xsl:value-of select="@name"/></h2>
    <!-- Apply templates for each Recipe -->
    <xsl:apply-templates select="Category/Recipes/Recipe"/>
  </xsl:template>

  <!-- Template to match each Recipe element -->
  <xsl:template match="Recipe">
    <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 20px;">
      <h3><xsl:value-of select="@name"/></h3>
      <p><strong>Description:</strong> <xsl:value-of select="Description"/></p>
      <p><strong>Prep Time:</strong> <xsl:value-of select="PrepTime"/> minutes</p>
      <p><strong>Cooking Time:</strong> <xsl:value-of select="CookingTime"/> minutes</p>
      <p><strong>Estimated Cost:</strong> $<xsl:value-of select="EstimatedCost"/></p>
      <!-- Apply templates for NutritionalValue, Ingredients, Instructions, SatisfactionScore, Cook, and Review -->
      <xsl:apply-templates select="NutritionalValue"/>
      <xsl:apply-templates select="Ingredients"/>
      <xsl:apply-templates select="Instructions"/>
      <xsl:apply-templates select="SatisfactionScore"/>
      <xsl:apply-templates select="Cook"/>
      <xsl:apply-templates select="Review"/>
    </div>
  </xsl:template>

  <!-- Template to match NutritionalValue element -->
  <xsl:template match="NutritionalValue">
    <p><strong>Nutritional Value:</strong></p>
    <ul>
      <li><xsl:value-of select="Energy"/></li>
      <li><xsl:value-of select="Carbohydrates"/></li>
      <li><xsl:value-of select="Fat"/></li>
      <li><xsl:value-of select="Sugar"/></li>
    </ul>
  </xsl:template>

  <!-- Template to match Ingredients element -->
  <xsl:template match="Ingredients">
    <p><strong>Ingredients:</strong></p>
    <ul>
      <!-- Apply templates for each Ingredient -->
      <xsl:apply-templates select="Ingredient"/>
    </ul>
  </xsl:template>

  <!-- Template to match each Ingredient element -->
  <xsl:template match="Ingredient">
    <li><xsl:value-of select="."/></li>
  </xsl:template>

  <!-- Template to match Instructions element -->
  <xsl:template match="Instructions">
    <p><strong>Instructions:</strong></p>
    <ol>
      <!-- Apply templates for each Cooking step -->
      <xsl:apply-templates select="Cooking"/>
    </ol>
  </xsl:template>

  <!-- Template to match each Cooking step -->
  <xsl:template match="Cooking">
    <li><xsl:value-of select="."/></li>
  </xsl:template>

  <!-- Template to match SatisfactionScore element -->
  <xsl:template match="SatisfactionScore">
    <p><strong>Satisfaction Score:</strong> <xsl:value-of select="."/></p>
  </xsl:template>

  <!-- Template to match Cook element -->
  <xsl:template match="Cook">
    <p><strong>Cook Details:</strong></p>
    <ul>
      <li><strong>ID:</strong> <xsl:value-of select="Details/@ID"/></li>
      <li><strong>Name:</strong> <xsl:value-of select="Details/@name"/></li>
      <li><strong>Age:</strong> <xsl:value-of select="Details/@age"/></li>
      <li><strong>Location:</strong> <xsl:value-of select="Details/@location"/></li>
      <li><strong>Hobbies:</strong> <xsl:value-of select="Details/@hobbies"/></li>
      <li><strong>Favorite Dish:</strong> <xsl:value-of select="Details/FavDish"/></li>
      <li><strong>Experience:</strong> <xsl:value-of select="Details/Experience"/></li>
      <li><strong>Skill Level Points:</strong> <xsl:value-of select="Details/SkillLevel/@points"/></li>
      <li><strong>Number of Posts:</strong> <xsl:value-of select="Details/SkillLevel/@posts"/></li>
      <li><strong>Email:</strong> <xsl:value-of select="Details/Contact/Email"/></li>
      <li><strong>Phone:</strong> <xsl:value-of select="Details/Contact/Phone"/></li>
    </ul>
  </xsl:template>

  <!-- Template to match Review element -->
  <xsl:template match="Review">
    <p><strong>Review:</strong></p>
    <ul>
      <li><strong>User:</strong> <xsl:value-of select="UserPosted/@name"/></li>
      <li><strong>Date:</strong> <xsl:value-of select="UserPosted/@date"/></li>
      <li><strong>Points:</strong> <xsl:value-of select="UserPosted/Details/@points"/></li>
      <li><strong>Number of Posts:</strong> <xsl:value-of select="UserPosted/Details/@posts"/></li>
      <li><strong>Comment:</strong> <xsl:value-of select="UserPosted/Comment"/></li>
      <li><strong>Upvotes:</strong> <xsl:value-of select="Votes/Upvotes"/></li>
      <li><strong>Downvotes:</strong> <xsl:value-of select="Votes/Downvotes"/></li>
    </ul>
  </xsl:template>

</xsl:stylesheet>
