package com.kirin.common.print;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.layout.border.Border;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import com.kirin.common.utils.DateUtils;

public class TableBuilder<T> {

	public static final String FORM_STYLE = "FORM";
	public static final String TABLE_STYLE = "TABLE";
	
	private PdfFont tableFont = null;//表格内容字体
	
	private boolean isBorder = true;//默认为存在表格边框
	
	
	private List<String> tableColumn = null;
	
	private List<T> tableData = null;
	
	
	public PdfFont getTableFont() {
		if(tableFont == null){
			try {
				tableFont = PdfFontFactory.createFont("STSongStd-Light", "UniGB-UCS2-H",false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return tableFont;
	}

	public void setTableFont(PdfFont tableFont) {
		this.tableFont = tableFont;
	}

	public boolean isBorder() {
		return isBorder;
	}

	public void setBorder(boolean isBorder) {
		this.isBorder = isBorder;
	}

	public List<String> getTableColumn() {
		return tableColumn;
	}

	public void setTableColumn(List<String> tableColumn) {
		this.tableColumn = tableColumn;
	}

	public List<T> getTableData() {
		return tableData;
	}

	public void setTableData(List<T> tableData) {
		this.tableData = tableData;
	}

	public TableBuilder() {
	}
	
	public <T> TableBuilder(List<String> tableColumn,List<T> entityArr) {
		
	}
	
	public <T> TableBuilder(PdfFont tableFont,Border border,List<String> tableColumn,List<T> entityArr,String tableType) {
		
	}
	
	public int getTableSize(List<String> tableColumn,List<T> entityArr){
		if(tableColumn != null && tableColumn.size() > 0){
			return tableColumn.size();
		}else if(entityArr != null && entityArr.size() > 0){
			Class clazz = entityArr.getClass();
			Field[] fields = clazz.getDeclaredFields();
			if(fields != null && fields.length > 0){
				tableColumn = new ArrayList<String>();
				for (Field field : fields) {
					tableColumn.add(field.getName());
				}
			}
		}
		return tableColumn.size();
	}
	
	public Table createTable(List<String> tableColumn,List<T> entityArr,String tableType) throws Exception{
		Table table = null;
		if(tableType.equals(FORM_STYLE)){
			table = new Table(4);
			for (Object object : entityArr) {
				Class clazz = object.getClass();
				Object instance = clazz.newInstance();
				Field[] fields = clazz.getDeclaredFields();
				for(String column:tableColumn){
					String columnName = column.split(":")[0].toUpperCase();
					for(Field field:fields){
						String fieldName = field.getName();
						if(fieldName.toUpperCase().equals(columnName)){
							PropertyDescriptor pd = new PropertyDescriptor(field.getName(),clazz);
							Method m = pd.getReadMethod();
							Object value = m.invoke(object);
							Class fieldType = field.getType();
							if(fieldType.isAssignableFrom(Date.class)){
								value = DateUtils.format((Date)value, "yyyy-MM-dd hh:mm:ss");
							}
							if(fieldType.isAssignableFrom(Float.class)){
								value = new BigDecimal(value.toString());
							}
							System.out.println("["+fieldName+"]       "+m.getName()+"="+value);
							
							table.addCell(new Cell().setBorder(Border.NO_BORDER).setFont(this.getTableFont()).setBold().add(column.split(":")[1]+":"));
					        table.addCell(new Cell().setBorder(Border.NO_BORDER).setFont(this.getTableFont()).add(value+""));
						}
					}
				}
			}
		}
		return table;
	}
	
	
	public static void main(String[] args) throws IntrospectionException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		List<String> columns = new ArrayList<String>();
		columns.add("ID:编号");
		columns.add("NAME:姓名");
		columns.add("AGE:年龄");
		columns.add("BIRTH:出生日期");
		

	}

}
