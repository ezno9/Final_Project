package com.edu.mvc.model.dto;

public class CalendarDto {
   private String _id;
   private String title;
   private String start;
   private String end;
   private String description;
   private String type;
   private String username;
   private String backgroundColor;
   private String textColor;
   private boolean allDay;
   
   public CalendarDto() {
      super();
   }

   public CalendarDto(String _id, String title, String start, String end, String description, String type,
         String username, String backgroundColor, String textColor, boolean allDay) {
      super();
      this._id = _id;
      this.title = title;
      this.start = start;
      this.end = end;
      this.description = description;
      this.type = type;
      this.username = username;
      this.backgroundColor = backgroundColor;
      this.textColor = textColor;
      this.allDay = allDay;
   }

   public String get_id() {
      return _id;
   }

   public void set_id(String _id) {
      this._id = _id;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getStart() {
      return start;
   }

   public void setStart(String start) {
      this.start = start;
   }

   public String getEnd() {
      return end;
   }

   public void setEnd(String end) {
      this.end = end;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getBackgroundColor() {
      return backgroundColor;
   }

   public void setBackgroundColor(String backgroundColor) {
      this.backgroundColor = backgroundColor;
   }

   public String getTextColor() {
      return textColor;
   }

   public void setTextColor(String textColor) {
      this.textColor = textColor;
   }

   public boolean isAllDay() {
      return allDay;
   }

   public void setAllDay(boolean allDay) {
      this.allDay = allDay;
   }

   @Override
   public String toString() {
      return "CalendarDto [_id=" + _id + ", title=" + title + ", start=" + start + ", end=" + end + ", description="
            + description + ", type=" + type + ", username=" + username + ", backgroundColor=" + backgroundColor
            + ", textColor=" + textColor + ", allDay=" + allDay + "]";
   }
   
   
   
   
}