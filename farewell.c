#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

unsigned get_file_size (const char* file_name)
{
    struct stat sb;
    stat(file_name, & sb);
    return sb.st_size;
}

unsigned char* read_whole_file (const char* file_name)
{
    unsigned size = get_file_size(file_name);
    unsigned char* content = malloc(size + 1);

    FILE* file = fopen(file_name, "r");
    size_t bytes_read = fread(content, sizeof (unsigned char), size, file);
    fclose(file);

    return content;
}

/* this is copied from http://coding.debuntu.org/c-implementing-str_replace-replace-all-occurrences-substring */
/* hope it works */
unsigned char* str_replace(const unsigned char* string, const unsigned char* substr, const unsigned char* replacement)
{
    unsigned char* tok = NULL;
    unsigned char* newstr = NULL;
    unsigned char* oldstr = NULL;
    unsigned char* head = NULL;
 
    /* if either substr or replacement is NULL, duplicate string a let caller handle it */
    if (substr == NULL || replacement == NULL) return strdup (string);
    newstr = strdup(string);
    head = newstr;
    while ((tok = strstr(head, substr)))
    {
        oldstr = newstr;
        newstr = malloc(strlen(oldstr) - strlen(substr) + strlen(replacement) + 1);
        /*failed to alloc mem, free old string and return NULL */
        if (newstr == NULL)
        {
            free(oldstr);
            return NULL;
        }
        memcpy(newstr, oldstr, tok - oldstr);
        memcpy(newstr + (tok - oldstr), replacement, strlen(replacement));
        memcpy(newstr + (tok - oldstr) + strlen(replacement), tok + strlen(substr),
               strlen(oldstr) - strlen(substr) - (tok - oldstr));
        memset(newstr + strlen(oldstr) - strlen(substr) + strlen(replacement), 0, 1);
        /* move back head right after the last replacement */
        head = newstr + (tok - oldstr) + strlen(replacement);
        free(oldstr);
    }
    return newstr;
}

int main(int argc, char* argv[])
{
    unsigned char key[] = "i hope in the next ten years there would be no other farewell letter brilliant than this one";

    unsigned char* content = read_whole_file(argv[1]);

    unsigned char* tmp = str_replace(content, "\n", "");
    free(content);
    content = tmp;
    tmp = str_replace(content, "\t", "");
    free(content);
    content = tmp;
    tmp = str_replace(content, "\r", "");
    free(content);
    content = tmp;
    tmp = str_replace(content, " ", "");
    free(content);
    content = tmp;

    unsigned char* decrypted = malloc(strlen(content) / 2); // i don't want to calculate

    int i = 0;
    unsigned char* pch = strtok(content, ",");
    while (pch != NULL)
    {
        decrypted[i] = atoi(pch) ^ key[i % strlen(key)];
        pch = strtok(NULL, ",");
        ++i;
    }

    decrypted[i] = '\0';
    printf("%s", decrypted);

    free(content);
    free(decrypted);

    return 0;
}
