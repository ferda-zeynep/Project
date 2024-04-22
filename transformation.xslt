<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
    {
      "Catalog": {
        "Continents": [
          <xsl:apply-templates select="Catalog/Continent"/>
        ]
      }
    }
  </xsl:template>

  <xsl:template match="Continent">
    {
      "name": "<xsl:value-of select="@name"/>",
      "Countries": [
        <xsl:apply-templates select="Country"/>
      ]
    }
  </xsl:template>

  <xsl:template match="Country">
    {
      "name": "<xsl:value-of select="@name"/>",
      "zone": "<xsl:value-of select="@zone"/>",
      "Categories": [
        <xsl:apply-templates select="Category"/>
      ]
    }
  </xsl:template>

  <xsl:template match="Category">
    {
      "flavor": "<xsl:value-of select="@flavor"/>",
      "spice_level": "<xsl:value-of select="@spice_level"/>",
      "course_type": "<xsl:value-of select="@course_type"/>",
      "Recipes": [
        <xsl:apply-templates select="Recipes/Recipe"/>
      ]
    }
  </xsl:template>

  <xsl:template match="Recipe">
    {
      "ID": "<xsl:value-of select="@ID"/>",
      "name": "<xsl:value-of select="@name"/>",
      "date": "<xsl:value-of select="@date"/>",
      "Description": "<xsl:value-of select="Description"/>",
      "PrepTime": "<xsl:value-of select="PrepTime"/>",
      "CookingTime": "<xsl:value-of select="CookingTime"/>",
      "EstimatedCost": "<xsl:value-of select="EstimatedCost"/>",
      "NutritionalValue": {
        "Energy": "<xsl:value-of select="NutritionalValue/Energy"/>",
        "Carbohydrates": "<xsl:value-of select="NutritionalValue/Carbohydrates"/>",
        "Fat": "<xsl:value-of select="NutritionalValue/Fat"/>",
        "Sugar": "<xsl:value-of select="NutritionalValue/Sugar"/>"
      },
      "Ingredients": [
        <xsl:apply-templates select="Ingredients/Ingredient"/>
      ],
      "Instructions": [
        <xsl:apply-templates select="Instructions/*"/>
      ],
      "SatisfactionScore": "<xsl:value-of select="SatisfactionScore"/>",
      "Cook": {
        "Details": {
          "ID": "<xsl:value-of select="Cook/Details/ID"/>",
          "name": "<xsl:value-of select="Cook/Details/name"/>",
          "age": "<xsl:value-of select="Cook/Details/age"/>",
          "location": "<xsl:value-of select="Cook/Details/location"/>",
          "hobbies": "<xsl:value-of select="Cook/Details/hobbies"/>",
          "FavDish": "<xsl:value-of select="Cook/Details/FavDish"/>",
          "Experience": "<xsl:value-of select="Cook/Details/Experience"/>",
          "SkillLevel": {
            "points": "<xsl:value-of select="Cook/Details/SkillLevel/@points"/>",
            "posts": "<xsl:value-of select="Cook/Details/SkillLevel/@posts"/>"
          },
          "Contact": {
            "Email": "<xsl:value-of select="Cook/Details/Contact/Email"/>",
            "Phone": "<xsl:value-of select="Cook/Details/Contact/Phone"/>"
          }
        }
      },
      "Review": {
        "UserPosted": {
          "name": "<xsl:value-of select="Review/UserPosted/@name"/>",
          "date": "<xsl:value-of select="Review/UserPosted/@date"/>",
          "ID": "<xsl:value-of select="Review/UserPosted/@ID"/>",
          "Details": {
            "points": "<xsl:value-of select="Review/UserPosted/Details/@points"/>",
            "posts": "<xsl:value-of select="Review/UserPosted/Details/@posts"/>"
          },
          "Comment": "<xsl:value-of select="Review/UserPosted/Comment"/>",
          "Votes": {
            "Upvotes": "<xsl:value-of select="Review/UserPosted/Votes/Upvotes"/>",
            "Downvotes": "<xsl:value-of select="Review/UserPosted/Votes/Downvotes"/>"
          }
        }
      }
    },
    <xsl:if test="position() &lt; last()">,</xsl:if>
  </xsl:template>

  <xsl:template match="Ingredient">
    "<xsl:value-of select="."/>"<xsl:if test="position() &lt; last()">,</xsl:if>
  </xsl:template>

  <xsl:template match="Instructions/*">
    "<xsl:value-of select="."/>"<xsl:if test="position() &lt; last()">,</xsl:if>
  </xsl:template>

</xsl:stylesheet>
