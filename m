Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214668;
	b=o5eF/trm2FbqRdqybn+aFnignJTOlJvAtOKz4YOQTVlQnJeUxaMimLr0eltq9nHHO3XE
	 HbZU6SZmFZ0Lqi2r28g7pHn7CXoJSGyeirDG5KHT+iJWMkyW01qhqlZa+IEkOOB26RwRf
	 38CRCo0WUQR5ATZoSEkHVlARNyg4xbI0bu4+RgzcCSFkh1BwI9l66vhCyLeWFFeBO7Dwz
	 alurAizk9RdILisSCXmDiI8doFUtEoWduOfAlU8SkXcdcby9mle8b9Q9n9Qqbwjtb2Cbb
	 GjgW1MBVxxcKpSStYNP3roCSE7AjyMAinXJRyAHBTcqqUGaOe5SBEJq98oTRLEpZHGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=6gPNbhKnS4UiPYe9GkhcEdm+Vle3xI8UXMcC7kdMJ/8=;
	b=l9D3aiMcG+g4bRZdLkMgrn6U6AragB92HdUEQHWEXj51XUuk+VvLr+twOb3k/uZN38qy
	 eotlig0pKBOhhP1aTMakY/Q2hrNc8/KIiElvUhXsxb5hvAwcHqFFLHhS/b3+DLnPJ399m
	 svcdoVYCGoMrWiREoAqTQ9cYRyXxN8MJYutKuB1JqXQgP5kSSAwA8a4sdM5jZNiqqPmyP
	 SNNk9nXioT/4od5H565d+vhD8vxbQZGJhgVWiYp+WaD5n0lUFIBLS5bAU7fjWyetI5048
	 9x5jH3exMF84ZJ5OgVNxluPukxbfahVNpGl6n1ic4+Nf3V0JyN9loUv4aS0oOMp0/1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJwNHGY2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D501606A31C
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 08:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D501606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJwNHGY2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so9121075e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 00:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214667; x=1794819467; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gPNbhKnS4UiPYe9GkhcEdm+Vle3xI8UXMcC7kdMJ/8=;
        b=eJwNHGY2/8U6qs1wJ+YJFIUWPepYpz7p4XDO0qGe9HAHzrEVuAkH176VWzTnHmayVR
         GwRUdaEOWwgCXjwj6iu71zDAYh+/LauN+rkrkRgY05TwLYGP1k3QQAMB8KRMu1WWHsAP
         xy1zuXDYQ3L30nuUuI8Gs1SklW5d2dXJx7xK3IbVV7ixGbtbj7pfGyKX2CaSEbg/KG0o
         qaDuUSDxYhe/13LozO0EWiT3+MNig/WRQjhkmckLI9X8wyl8hGVfpseLsAbt+mATklyv
         hHF0Rvl6iv65yE5mYWs4i1d36/88rKjaUDfELcFQKZF6MLfrHSlUtegc0ONJn703Klc6
         jz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214667; x=1794819467;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gPNbhKnS4UiPYe9GkhcEdm+Vle3xI8UXMcC7kdMJ/8=;
        b=mBKk8/bCffheC0lh2NlQiLwnCtFVTUNeTlZOh1ZCUgNPY4Le5k/4V45JIxSRzzocro
         98XyK3Fhi6s0lb8GPxSWeBZGAD+E0QuVst+DgsBVpbFR+xQtxdQiB4sdLsFhjMgJon7U
         PnC5OzXESxYQbUQ2hcCyQB+rx4EF1NrD8mIvcEiy625djv8e2o3JCbu0SMyyKCo7NJyN
         f2e5fwA20vZcEOw6i3+XWI/HMk4xlOrKtSAOiFDdx02NdgD9e77S8fyS/GQyXBaleFVI
         s0ET9YlGvUYnl7YdYcq48bkjjU4qI3NBLZqnfMdmb8+9RNClH2SQCdyUTL0dM8Z5wAP3
         q0mw==
X-Forwarded-Encrypted: i=1; AL+hErFlMINQCHB8gaLA9TY9mGLjNF0oCUCp2x7gXBxX1k/6i07ExusP43h2RA/hh/SULaCsxTZfxBnORGFD@lists.linux.dev
X-Gm-Message-State: APuU4Z+s+Q15W8hv9Mg/9yvk6hGJbr5B6xMaoSx6kv4yLR5LuiHuvPYc
	Fa2bpJUoVkTUIIPf8/ZrqDdm9Gan+jYTyuWeH3P4yjBv9SvE7lFrzAxs
X-Gm-Gg: AYBFou1ClQKaEibQ46aDP+qM6v0rj2SwbpuNkLzqtDaO8jGDVRlUZmDqaFO17yIRozQ
	LbruThlvObXtQwNeaFEFIG0ZNmOCJWeBfPsbJ90/6jjLCXjz7foxZ91ULnIER2CsQ0WzkEwSRwc
	YSAS5/704Kom8UmrWzb5a65OXK0nVhpc04Npn8QcSnK9Wf4MCKDV2F4pTmsZxgrf5bpgSjUz5JS
	QL/eE4LA5HNC94rgMWT2rqD55DyGgItmPXKtwviR8Cup/V6Nc54XsRRdOh33EuKF6njE4mqkyIC
	Mo0O4OUP1jiJ3fNu5vV61a2ZVOPpkEWeyqjZE9i4x1sxbfNIWs6ii20IpIPBwhHkIBGcsKFNRG1
	wUbKko6MULwFBw329XlDAHMlpjJN60ICujf/bQz1teHiCc6slc4d5MNuu3tCkc8aljOfp7mYL06
	yIReNLJ8+HYvho7K0ubPBowB2/okjHR/0zaW7l2o6NILOEs+UGO2tP7ExIDXIToEuAIrxDAdaCq
	cZ1Ip1S7XeRw+NEy7hgvC3rD5dAPmKCoN3RvlV6U4xl32jHA0nL9BHGI0u+QEkslXkf0PnL/iHf
	ohUWOcxc2ChVAglXYvI5bKM=
X-Received: by 2002:a05:600c:4f86:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4b960d9b17dmr61969495e9.9.1794214666809;
        Mon, 09 Nov 2026 00:57:46 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79501502asm149200295e9.2.2026.11.09.00.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 00:57:46 -0800 (PST)
Message-ID: <a9fb2d3c-d518-49d3-9479-a25fa2cfc5b3@gmail.com>
Date: Mon, 9 Nov 2026 09:57:43 +0100
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mm: limit pagecache folio refcount when splicing
 into pipes
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Song Liu <songliubraving@fb.com>, Rik van Riel <riel@surriel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Hugh Dickins <hughd@google.com>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin
 <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Steve Sistare <steven.sistare@oracle.com>, John Hubbard
 <jhubbard@nvidia.com>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-arch@vger.kernel.org, iommu@lists.linux.dev, stable@vger.kernel.org
References: <20261107-refcount_overflow_stable-v2-0-c38f6809b106@kernel.org>
 <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261107-refcount_overflow_stable-v2-2-c38f6809b106@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
> Similar to mapping pagecache folios into page tables, let's reject
> additional references when splicing folios into a pipe if the refcount
> is at its limit, similar to how we handle it during GUP.
> 
> This will prevent more cases of possible folio refcount overflows with
> large pagecache folios.
> 
> Let's keep it simple and check in the two callers of
> splice_folio_into_pipe(). Return -EOVERFLOW if the limit prevents any
> progress, so do_splice_read() can fall back to copy_splice_read() when
> read_iter is available. This keeps sendfile() and other splice users
> working when ordinary reads would still succeed.
> 
> Also fall back to copying in FUSE when taking another reference through
> fuse_ref_folio() would exceed the limit.
> 
> Also check in try_get_page() to cover pipe-buffer duplication by tee()
> and partial pipe-to-pipe splicing.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/fuse/dev.c      |  5 +++--
>  fs/splice.c        |  8 +++++++-
>  include/linux/mm.h |  9 ++++++---
>  mm/filemap.c       | 11 ++++++++---
>  mm/shmem.c         |  4 ++++
>  5 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 3641abb90d6bb..4f6b7b42bfd3e 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -1265,9 +1265,10 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>  		if (cs->write && cs->pipebufs && folio) {
>  			/*
>  			 * Can't control lifetime of pipe buffers, so always
> -			 * copy user pages.
> +			 * copy user pages. Also copy folios at their refcount limit.
>  			 */
> -			if (cs->req->args->user_pages) {
> +			if (cs->req->args->user_pages ||
> +			    unlikely(folio_ref_count_over_limit(folio))) {
>  				err = fuse_copy_fill(cs);
>  				if (err)
>  					return err;
> diff --git a/fs/splice.c b/fs/splice.c
> index e6d43329ed3f0..df73a4e65118b 100644
> --- a/fs/splice.c
> +++ b/fs/splice.c
> @@ -956,6 +956,7 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>  			      unsigned int flags)
>  {
>  	unsigned int p_space;
> +	ssize_t ret;
>  
>  	if (unlikely(!(in->f_mode & FMODE_READ)))
>  		return -EBADF;
> @@ -977,7 +978,12 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>  	 */
>  	if ((in->f_flags & O_DIRECT) || IS_DAX(in->f_mapping->host))
>  		return copy_splice_read(in, ppos, pipe, len, flags);
> -	return in->f_op->splice_read(in, ppos, pipe, len, flags);
> +	ret = in->f_op->splice_read(in, ppos, pipe, len, flags);
> +
> +	/* Fallback to copying when hitting folio refcount limits. */
> +	if (unlikely(ret == -EOVERFLOW) && in->f_op->read_iter)
> +		ret = copy_splice_read(in, ppos, pipe, len, flags);

here it can't tell where the -EOVERFLOW came from, if another file
returns -EOVERFLOW (i.e. tty_fops uses copy_splice_read, and
n_hdlc_tty_read() returns -EOVERFLOW after dropping the frame), it now
gets a second read. also, the first read already lost data. so the data
read returns different data, the dropped frame is never reported and
returns the next frame instead.


-- 
cheers,
jose a. p-a
