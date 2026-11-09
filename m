Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218843;
	b=aR3sDL5EpqVkakcwczeptqy1TMHWRSOodhNMv2LmU9xmLgoKGkEhcQeGP5+rOcwEUbuZ
	 StCOEXE9B/UXX6Ic+TnLn1SkfVi2aTOiLGt3xpetoNJbkCRRvxZ3qPoHzMacjCaM5/WBh
	 tYYeXaEA4hvuLwft+9M+GDyXHHpjAHAo0BUZXGPGReVwNwknQNsnpEeS0IEqc9g4fxJ7O
	 dITbSrRN/diYXK5kHkKsnMod0MkVnNm61sBakO+bBQDG16G8qLi3rvg3TFRBNKWkKppCs
	 O7GhQrQNoBxh51uguhv7DCcOHH1rt52kOW1rvGu53OGNVmnokrVQ+QvRLypz9hUYsiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BCv0Nnsjb1CATtKd+NoK/9Eh7t2jtA8IE/DMvxos3og=;
	b=qXUAxUgPnh8TxlyRHQdAUzm2x3o6bp79ti4rHF6a/F8Ibd0b9/UHvRpvl/jhHGW0V79Y
	 u/9RLeEsonVrQLbzfU1ykhLOE7WT8GTTywvfdURBBViD2MvQ7/6ojPky1McatGyXkwcsd
	 IlERSjHP8mRyzEabx08VrlFyELMkEBCqB81jada+xycwtEH/A4yExgLIs1H+HvruMKRTQ
	 ducl9WxYvPPB3OWkMX3NKhAu4RA44fxxLy7Ikqq4G5bR2w5L4N5aWJSydLVEZDPFjhxOg
	 be/c/jmBg5gjVdDgUwb/vA0gdVwphIsYnPO0S0OtCRchiBDNZlTbkZ0bkDLfa2tDKLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iceZCnk6;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36F5606D802
	for <fuse-devel@lists.linux.dev>; Mon,  9 Nov 2026 10:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C36F5606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iceZCnk6
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so6683815e9.3
        for <fuse-devel@lists.linux.dev>; Mon, 09 Nov 2026 02:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794218841; x=1794823641; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCv0Nnsjb1CATtKd+NoK/9Eh7t2jtA8IE/DMvxos3og=;
        b=iceZCnk66lK9ylJVC2qDP7oIUCtw8xlAL4Pmzi5siPuSOUPu9+YMNz5v7CgITB3PAx
         n46Rro8na4wNFvzXoJTOV59doedhDkHS6jTy2YavNRL68rwl9wDbtJ2jnvLoI4LrTBJr
         2lH5NyYxs5fzGT00RFFcHsQytpXH3AhiEHL5Qlmdmq/DB2CQKkNf04ENhZBaQkRmOieA
         1KPfqbXQgFoIazbwvbgkfcbPhwnf57HmxQlF78mmIu25592iSjumMPcQrclFt3ifA+6q
         0rCI5sanSSnmCMf/PLhDNr8+3wlPhpZcSbGlw1qgG/SfjeOIonLKk5jBHQw5zVN4QBG2
         6TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218841; x=1794823641;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCv0Nnsjb1CATtKd+NoK/9Eh7t2jtA8IE/DMvxos3og=;
        b=XqhKeNCCrgMOsiAbTvieYULpokuuRitK7Sd2F3tGXHB0KlltIBEpamjR7IWGBhdgrY
         Agq4Zn8vUYvPb6vsBuMZ+sIVUuJyWzMWMhjwYwrbmMg7E7fCv39bbNFZuXcZqOj3BR2W
         3+0FjFUy5lzdAcdYuXwGxZb/KfVRYJhomqpRvwr6Hms6MLqhIs2BN/SkcHHoHMkh++Wi
         G3CB8Wf4P/rkvqWQZtoLjj3NNvzHXQbmYEK6leIfDqUIIlP7ZWhaC01pDvZwty3Nqdqb
         /RybLx14F+ipvI09ouj+Uv3TfFPHDwu4cYHkQ4w+H8cWZbwQfqtKFqxrSfPCtiBuYbfp
         BHhA==
X-Forwarded-Encrypted: i=1; AL+hErG1aDNJsO2HoHQ0/NqKsvKdYcX3A+rrkceBI1Z8ksmE8H962oyxY6Q8ZPlqg7cl648/z/b7uD1cEENg@lists.linux.dev
X-Gm-Message-State: APuU4Z8l/qEo4laPaCOzV1l9QdS19b7dbqLI/xolkPpM+mArCkxCwmrV
	1nH9a723/IRpv30hKt6p92t9GBszWq42Y3XIalfzwM6r62iocTdd/rIZ
X-Gm-Gg: AYBFou2zdEmVwSdcuX+9R5xVHBnaubtZPuPs/+4/NSGRN2VX8wLWm5uTIUDP1Qk0VGF
	PWc9OghcwMI9ufO+uCRF2t3+qnEgjOVchR3n6PdvSvTUUXkmi/qhr2lftLHo8FFCdANshKUDECj
	vDPvo1ysbHuLtl9+zpWxZ5KHlwJVfOetHke/lqTsX8ABHgXvrvAvPAVG49SOpmY1vAZGdYvWZ0H
	g43kljfjQ8R7a/Yg8GcZmyDN+97MZyFUDd4xoGNcTiSMxjVG6RJYxdWZWHjZ2lODmxlzpkfMnAq
	Myzkpc6RZE36HRVaWOtnFKZfLBRlzNNr9xdlt3T6x431CZ3+3/JHqeW9DfITmVusODnC269H0nF
	yIeU1mfENbOEiM+OUPPvt6slGtp3AUCkwpv9nILTqWRZt6NXPfJ8uP3sOlvH1jphpGihZj83vN7
	a6Yu5q9p4KUeujNocS7gEpChcaNHSrQLb1xmgub2YgX8hGBfDkwxTFP83NI0pzeZkeneygbRmOu
	WtlOfECtykyXjfq7jWdPOecE7CY1vHsq9ddbtwU6zoIHm6QSmmFXr7nNdKGw90CgqwMfIks/VeZ
	d9iBxFwMzur0h3/eqzQOrNs=
X-Received: by 2002:a05:600c:46cb:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4b94d762ec2mr69628225e9.1.1794218840912;
        Mon, 09 Nov 2026 02:07:20 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783f1d6sm8829668f8f.46.2026.11.09.02.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:07:20 -0800 (PST)
Message-ID: <bb6fa14e-0a98-4b31-899d-0b1c883d0608@gmail.com>
Date: Mon, 9 Nov 2026 11:07:17 +0100
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
 <a9fb2d3c-d518-49d3-9479-a25fa2cfc5b3@gmail.com>
 <8d23b1eb-72aa-479d-9486-dbfd86d8414c@kernel.org>
 <43fc45ff-8636-4961-a80a-29844c15d7a1@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <43fc45ff-8636-4961-a80a-29844c15d7a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 10:49 AM, David Hildenbrand (Arm) wrote:
> On 11/9/26 10:30, David Hildenbrand (Arm) wrote:
>> On 11/9/26 09:57, Jose A. Perez de Azpillaga wrote:
>>> On 11/7/26 11:23 PM, David Hildenbrand (Arm) wrote:
>>>> Similar to mapping pagecache folios into page tables, let's reject
>>>> additional references when splicing folios into a pipe if the refcount
>>>> is at its limit, similar to how we handle it during GUP.
>>>>
>>>> This will prevent more cases of possible folio refcount overflows with
>>>> large pagecache folios.
>>>>
>>>> Let's keep it simple and check in the two callers of
>>>> splice_folio_into_pipe(). Return -EOVERFLOW if the limit prevents any
>>>> progress, so do_splice_read() can fall back to copy_splice_read() when
>>>> read_iter is available. This keeps sendfile() and other splice users
>>>> working when ordinary reads would still succeed.
>>>>
>>>> Also fall back to copying in FUSE when taking another reference through
>>>> fuse_ref_folio() would exceed the limit.
>>>>
>>>> Also check in try_get_page() to cover pipe-buffer duplication by tee()
>>>> and partial pipe-to-pipe splicing.
>>>>
>>>> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
>>>> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
>>>> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>>> ---
>>>>  fs/fuse/dev.c      |  5 +++--
>>>>  fs/splice.c        |  8 +++++++-
>>>>  include/linux/mm.h |  9 ++++++---
>>>>  mm/filemap.c       | 11 ++++++++---
>>>>  mm/shmem.c         |  4 ++++
>>>>  5 files changed, 28 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
>>>> index 3641abb90d6bb..4f6b7b42bfd3e 100644
>>>> --- a/fs/fuse/dev.c
>>>> +++ b/fs/fuse/dev.c
>>>> @@ -1265,9 +1265,10 @@ int fuse_copy_folio(struct fuse_copy_state *cs, struct folio **foliop,
>>>>  		if (cs->write && cs->pipebufs && folio) {
>>>>  			/*
>>>>  			 * Can't control lifetime of pipe buffers, so always
>>>> -			 * copy user pages.
>>>> +			 * copy user pages. Also copy folios at their refcount limit.
>>>>  			 */
>>>> -			if (cs->req->args->user_pages) {
>>>> +			if (cs->req->args->user_pages ||
>>>> +			    unlikely(folio_ref_count_over_limit(folio))) {
>>>>  				err = fuse_copy_fill(cs);
>>>>  				if (err)
>>>>  					return err;
>>>> diff --git a/fs/splice.c b/fs/splice.c
>>>> index e6d43329ed3f0..df73a4e65118b 100644
>>>> --- a/fs/splice.c
>>>> +++ b/fs/splice.c
>>>> @@ -956,6 +956,7 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>>>>  			      unsigned int flags)
>>>>  {
>>>>  	unsigned int p_space;
>>>> +	ssize_t ret;
>>>>  
>>>>  	if (unlikely(!(in->f_mode & FMODE_READ)))
>>>>  		return -EBADF;
>>>> @@ -977,7 +978,12 @@ static ssize_t do_splice_read(struct file *in, loff_t *ppos,
>>>>  	 */
>>>>  	if ((in->f_flags & O_DIRECT) || IS_DAX(in->f_mapping->host))
>>>>  		return copy_splice_read(in, ppos, pipe, len, flags);
>>>> -	return in->f_op->splice_read(in, ppos, pipe, len, flags);
>>>> +	ret = in->f_op->splice_read(in, ppos, pipe, len, flags);
>>>> +
>>>> +	/* Fallback to copying when hitting folio refcount limits. */
>>>> +	if (unlikely(ret == -EOVERFLOW) && in->f_op->read_iter)
>>>> +		ret = copy_splice_read(in, ppos, pipe, len, flags);
>>>
>>> here it can't tell where the -EOVERFLOW came from, if another file
>>> returns -EOVERFLOW (i.e. tty_fops uses copy_splice_read, and
>>> n_hdlc_tty_read() returns -EOVERFLOW after dropping the frame), it now
>>> gets a second read.
>>
>>
>> That's what claude told me during review, and when asked whether that actually
>> happened in practice it said no ;)
>>
>> So is that actually a problem?
> 
> Double checked, claude managed to confuse itself.
> 
> n_hdlc_tty_read() can indeed return -EOVERFLOW.
> 
> I should just have let splice keep failing, dealing with copy fallback starts to
> get annoying.
> 
> I guess switching to -ETOOMANYREFS should work (and might be a better fitting error)

I agree with that :)

-- 
cheers,
jose a. p-a
