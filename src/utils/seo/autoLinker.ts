import { DBKeywordRule } from '../../hooks/useSeoKeywords';

/**
 * Automatically injects internal anchors into a Markdown string based on a dynamic database dictionary.
 * Safely avoids modifying attributes, headings, HTML tags, or text already nested inside <a> tags
 * or Markdown links `[text](url)`.
 * 
 * @param content Raw Markdown content from the database
 * @param keywordRules Array of DBKeywordRule objects fetched from Supabase
 * @param maxLinksPerPost Hard limit to prevent over-optimization penalties
 */
export function injectInternalLinks(
  content: string, 
  keywordRules: DBKeywordRule[], 
  maxLinksPerPost: number = 5
): string {
  if (!content || !keywordRules || keywordRules.length === 0) return content;

  // Sort keywords by length descending so longer phrases match first
  const sortedRules = [...keywordRules].sort((a, b) => b.keyword.length - a.keyword.length);

  // Track already linked URLs within the current post execution path to prevent multi-linking dilution
  const linkedUrls = new Set<string>();
  let dynamicLinkCount = 0;

  // Split string into text fragments, HTML tags, and Markdown links to protect them
  // Group 1 matches HTML tags (e.g. <a href="...">) OR Markdown links (e.g. [text](url))
  const tokens = content.split(/(<\/?[^>]+>|\[.*?\]\(.*?\))/g);
  
  let insideAnchorBlock = false;

  const processedTokens = tokens.map((token) => {
    if (!token) return '';

    // If token is an HTML tag or a Markdown link, protect it.
    if (token.startsWith('<') || token.startsWith('[')) {
      if (token.toLowerCase().startsWith('<a ') || token.toLowerCase() === '<a>') {
        insideAnchorBlock = true;
      }
      if (token.toLowerCase() === '</a>') {
        insideAnchorBlock = false;
      }
      return token; // Return unaltered to prevent corruption
    }

    // If we are currently parsing text inside an existing HTML <a> tag, do not modify it
    if (insideAnchorBlock) {
      return token;
    }

    // Process plain text nodes for keyword injections
    let textNode = token;

    for (const rule of sortedRules) {
      if (dynamicLinkCount >= maxLinksPerPost) break;

      const cleanedKeyword = rule.keyword.trim();
      const targetUrl = rule.target_url.trim();
      
      // Skip if this specific landing destination has already been linked in this run
      if (linkedUrls.has(targetUrl)) continue;

      // Construct case-insensitive boundary regex matching the exact phrase safely
      const regex = new RegExp(`\\b(${cleanedKeyword})\\b`, 'gi');

      if (regex.test(textNode)) {
        // Replace first match instance with standard Markdown link syntax
        textNode = textNode.replace(regex, (match) => {
          linkedUrls.add(targetUrl);
          dynamicLinkCount++;
          return `[${match}](${targetUrl})`;
        });
      }
    }

    return textNode;
  });

  return processedTokens.join('');
}
