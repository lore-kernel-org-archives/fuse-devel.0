Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED1486BB9
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787155974; cv=none; b=Be7f5UBhgzyn9ePRN+eD7vZ6pV0AQyqbsnB1gQLqs4OFp2mS9p/04iADJYHJMY5LLqr+2lmbDooqbJWT8RR06ts6gPQZaybVX+YDE/O+pVHpL1axtXmXoYgzrgPi7W539i58lw7cV7IZhs4Hm0cHMzKCyNSK41rpsEpLXFA0HdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787155974; c=relaxed/simple;
	bh=YU/38JsMz4gbSQi9Z5l65cYhx8sF+PBBlci/NA0jW/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=esxaCzxnmcxLemikxzfLxsr3EvK0nrH+c4MZxMInJwgnm/93pd13Mnd+1OJ5KDxFotIfPppFu9QXRN3rA2g2+vi8fyMkZC0Ew0jb5AH7u3E/ycboDFls3zy9PMEyWUgpDPKze+3wOKbh7h0hGX6VhlLi6X9H+RvnTPhzG62o9/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b=GNnKj3x9; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20251104.gappssmtp.com header.i=@davidwei-uk.20251104.gappssmtp.com header.b="GNnKj3x9"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca80d708489so42794a12.1
        for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 09:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20251104.gappssmtp.com; s=20251104; t=1787155971; x=1787760771; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4vzXpvHAcLaYocQF8fljGBe8SJDDqmPaqS44yvJv+k=;
        b=GNnKj3x9E4KgO5AWQ5U9XI6Sp9mTwyjs14DfTKryKpglHne+C8vkRolfnYMTsnr3/p
         s7X2nvnGhVe/D7IVjBnGd/A4lhHtEPgtTb9sPLiYE2QhZdAu6/tYlWqzcoLFIRzT+tEd
         QEYi2NURlgzX7S/fVA3B0migjOY9JqwDN32+nGvkOUfy971ULdujgyXEdw8+wNH1z0ng
         Ryb3tm8hLGVNAAdDIkSzkXxwUYxHwl6Ep6aQe0U7kbgOFbNYHZi0WpJ1+7026qzPk9zc
         /Z1O1KdrsuCTmtMF/zJXdntGfUwIP6nFvQRN3XLwQ+EW5/FiHbYrKmm+D5g3hIwcTbtf
         3s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155971; x=1787760771;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4vzXpvHAcLaYocQF8fljGBe8SJDDqmPaqS44yvJv+k=;
        b=PAoGc+CXB2ChgLHpwR2QK12UD/535pdzOEGWcAeTil51pTK7+Bn1tXgoHyGeyzqnHF
         I0vDVdZTj8EbPM8nLs/6hdgp0bB/Dc5Xki3kPC0MDYvehlW42IqK1A0BT4TENWndkhvu
         DWVkFHzXYyFrcpNtcMJmn/afPWLQ5Mh8+plAwExQQgDW6hn6s53HVDbMwgjC3UDQLo4X
         /JMyJcMarsDe1JQ9qcr1ediNbrbZNilL7P+ndtsCqrjJ2ffKodHvF9dctYNNDqvPMoY/
         LTtTuPhzyk6tf3ECuctAXxaJ0Xjpyt5mT818RV86Hv63PlJFH6zo33Hi6mJlAwnHZfWz
         R3Qg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0COWW01W9s4ah/fe3+bsEki7QMuBe2g4UiIiJWjvn7oU58eZEnZhNCqKJWwjXDQ5sSGyEYHbBNnWi@lists.linux.dev
X-Gm-Message-State: AFuF++nCifwMzrHFuQJVZX4MmXnjAzxkZhFRx99xQg/acvskNqTGVXox
	T0VQwxzoWiN4WN5ZOSwTi76cpyODOBtHKk6970zfSYQKYqe8s3NtbZe140quyOxKtXE=
X-Gm-Gg: AR+sD10p2qM3Yo7eVG8mLGVD1VtJqQwc6AS4ileqsB33CWXLZl0nKFd8hOfUgzria83
	OzYvyyMeLO4WKQH+Ki9093JqfYqXtXmb9I343OaSolBYvWyXqA34eYMWGXX+xKJnU3ADmZt1y2i
	nF4fhWn3YAM5XTW05dYBWpSEydoyoITtqBaocI8gaYoPr+Lu/n4UfCDt0D87RV1V4o3ITUkXkqP
	LTobyt6DNz6pkiDJZWND1cW9WM1JQfREF1jFH5PP6tnEYgakVyK8nco9/kAsUi0Xj1EqdLicSAx
	pIACwl0SdNEGd43gZHiaMeKACifkQHKlh7F9hR/0PeRETYVKHPy7AnOuEhBE5xTASh/itQl5ADD
	X0Yi9L37tcunF+Z5hP9cogavu0X5ZfkL+xwwHzO77aVnTSZpxZ28oCTklfZnTR2V0GZpe2HYtoO
	J6sH+BPJpk02Zey20JYczzE+0qsqeA83CClcsvRijsEnbPsmz27fB53kGX0e12Gy4kQgKZU4NkB
	mWJQcH2hFp/kaOLNcDNkpnInQTTwNrc1dtjSA25OXOmUBRdzewr+M+Nqas8qA==
X-Received: by 2002:a17:90b:2d0b:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-395a044f2c1mr324350a91.1.1787155970721;
        Wed, 19 Aug 2026 09:12:50 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::6:8b67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad53874sm14632076c88.4.2026.08.19.09.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:12:50 -0700 (PDT)
Message-ID: <9bbda36f-740a-400f-92c0-3f6f3bdd0662@davidwei.uk>
Date: Wed, 19 Aug 2026 09:12:48 -0700
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] fuse: {io-uring} Allow to reduce the number of
 queues and request distribution
To: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Luis Henriques <luis@igalia.com>,
 Gang He <dchg2000@gmail.com>, fuse-devel@lists.linux.dev,
 Bernd Schubert <bschubert@ddn.com>
References: <20260529-reduced-nr-ring-queues_3-v5-0-1dc08c2fccf6@bsbernd.com>
 <65b910bc-67cf-49b6-b471-25280e7ba997@davidwei.uk>
 <bece8a86-83aa-43e5-bf8f-551537a2506d@bsbernd.com>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <bece8a86-83aa-43e5-bf8f-551537a2506d@bsbernd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-17 14:39, Bernd Schubert wrote:
> 
> 
> On 8/14/26 22:55, David Wei wrote:
>> On 2026-05-28 15:55, Bernd Schubert via B4 Relay wrote:
>>> This adds bitmaps that track which queues are registered and which queues
>>> do not have queued requests.
>>> These bitmaps are then used to map from request core to queue
>>> and also allow load distribution. NUMA affinity is handled and
>>> fuse client/server protocol does not need changes, all is handled
>>> in fuse client internally.
>>>
>>> Signed-off-by: Bernd Schubert <bschubert@ddn.com>
>>> ---
>>> Changes in v5
>>> - Rebased to miklos-for-next (Linux 7.2 base).
>>> - Folded "Fetch a queued fuse request on command registration" into
>>>     "Allow reduced number of ring queues", inlining fuse_uring_do_register()
>>>     into fuse_uring_register().
>>>     - Fixed retry logic in "Add retry attempts for numa local queues":
>>>       replaced cpu++ with cpumask_next_wrap(qid, mask) so each retry
>>>       advances to a genuinely different registered queue (Joanne)-
>>>     - Simplified "Prefer the current core over mapping" (Joanne).
>>>     - Folded READ_ONCE() annotation for ring->ready into "Allow reduced
>>>       number of ring queues" to match WRITE_ONCE() on the writer side and
>>>       suppress a KCSAN data-race warning.
>>>
>>> Changes in v4:
>>> - Fix leak of ring->numa_q_map
>>> - Fix q-imbalance due to an issue in static cpu->qid mapping
>>> - Performance tunings, like preferring the current cpu
>>> - Removal of distribution among queues, Joanne had concerns about it.
>>>     As it is an optimization, it can be added later again. At least
>>>     most of it was removed, some light distribution is still left in.
>>> - At the end of the series, add fuse debugfs entries. This could
>>>     be factored out.
>>> - Link to v3: https://lore.kernel.org/r/20251013-reduced-nr-ring-queues_3-v3-0-6d87c8aa31ae@ddn.com
>>>
>>> ---
>>> Bernd Schubert (7):
>>>         fuse: {io-uring} Add queue length counters
>>>         fuse: {io-uring} Rename ring->nr_queues to max_nr_queues
>>>         fuse: {io-uring} Use bitmaps to track registered queues
>>>         fuse: {io-uring} Allow reduced number of ring queues
>>>         fuse: {io-uring} Queue background requests on a different core
>>>         fuse: {io-uring} Add retry attempts for numa local queues for load distribution
>>>         fuse: {io-uring} Prefer the current core over mapping
>>>
>>>    fs/fuse/dev_uring.c       | 313 ++++++++++++++++++++++++++++++++++------------
>>>    fs/fuse/dev_uring_i.h     |  25 +++-
>>>    fs/fuse/inode.c           |   2 +-
>>>    include/uapi/linux/fuse.h |  10 +-
>>>    4 files changed, 269 insertions(+), 81 deletions(-)
>>> ---
>>> base-commit: 2dcf16d41cc04472a4f9bc6e99d0ab26cfb1afb1
>>> change-id: 20250722-reduced-nr-ring-queues_3-6acb79dad978
>>>
>>> Best regards,
> 
> Hi David,
> 
>>
>> Hi Bernd,
>>
>> What is the current status of this patchset? Do you intend to keep it as
>> is, or as Joanne mentioned combine it with queue add/remove?
> 
> I think we should combine it with queue registration from Joannes series
> and that got merged today. And with that should aim for the next merge
> window. I also want to add in the RCU lock for mapping updates.
> 
> Next step is that I need a merge request from Joanne for libfuse, so
> that I can test with FUSE_IO_URING_CMD_ADD_QUEUE. Or at least I need the
> branch. Well, I could add this in myself, but that would a) lead to
> merge conflicts and b) cause even more work.
> 
>>
>> We're running FUSE io_uring on fairly large hosts with >150 physical
>> cores. FUSE io_uring ends up creating 300+ io_uring instances, which
>> wastes memory and bumps against rlimit memlock.
> 
> I fully understand, however, I also cannot focus on one task only.
> Besides having a totally different day job (right now fixing ublk_drv
> tear-down issues), there is also libfuse (just check recent commit
> history... I hadn't planned to rewrite tests, but I didn't get pytest to
> hand out information what is failing. That all takes quite a bit of my
> previous time). I'm fully open for co-maintainers...

Of course, I understand you have other things you're working on. I
didn't want to step on your toes and work on something you've already
made progress on. At the same time, it sounds like you're spread thin,
so while I'm not certain on co-maintainership, perhaps we can talk about
how to shard this work better?

> 
> 
> Thanks,
> Bernd
