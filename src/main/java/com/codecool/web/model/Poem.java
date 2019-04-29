package com.codecool.web.model;

import java.util.Objects;

public final class Poem extends AbstractModel {

    private final String title;
    private final String content;
    private final int userId;

    public Poem (int id, String title, String content, int userId) {
        super(id);
        this.title = title;
        this.content = content;
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public int getUserId() {
        return userId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), title, userId);
    }
}

