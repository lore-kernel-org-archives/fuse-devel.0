Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12343EE1FD
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145883; cv=pass; b=A2I066gWjNEuQ1UP/lnmO4w6mnfb6icrgmqtwjFT5B+BG9rHRJK6tuzy8VXTJ9Mg9+SOxir8l0DxdTCAPj8ZDpJVnkkOBlYSAH+q+XHldlvcYuwmyKA2J1ImnerB8pv3ZsAK1sJWLCqAqRNIa0aJydT7PIgwckbW5J9bcc1i0B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145883; c=relaxed/simple;
	bh=Sj3xvQXzBwK5FlxAyMdrOj5qa7nyHTSMWIZmSF1lNkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BP7659opPI53ymZQiCPTu7belcKWgvTRDB0RMQZbO9saMKidmMxquvd4wbCRZ6MmepdLkN8bOhb+Tdp57PG1ZgUrbII9E+VdacUlN+I8MJ+pLb1i1xryQJPHF57U7c1JYvkqzgD2PzesvOj6Ro7pjXbaz3gqYWwWGyy1FylUgJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=gaO0dqiQ; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="gaO0dqiQ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-533861a59b8so26555151cf.1
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 03:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792145881; cv=none;
        d=google.com; s=arc-20260327;
        b=BUDdSPRGZU+oAI3iHZtsEHSciiuR0hmzcfBWqh1zENie1/aTO45MxEBvmIOB7E9PFm
         BjmU39Btb2MDh1bUhxWmcOrjY1uWAZsiZkRu1av6VhB/n+Odqm+jBmMiHx+YpWXwExlH
         EfjcZJPduIC4pv2j86nYHrWfqQ7h5u1Ioh1qyLCIhuABfmFFBX5z+m/k1A4GuqnR7aHm
         vh97Do4D5srz6m+Em9Zb0P6+XfvFXiZAq7WZzAxjB6L9y2CIJBvEhtf93+pjZhG8DEoT
         2oYoAbcRg+0T5SNaiHqq/bQXutnvEevxZyfnbt9UT/RQ4bUjq4N7HBMqjXkEgbuwkBt5
         hkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lEC/VqWw8QmnDgQ20hndozyHJsfsJu9lNxjgfFPQVRM=;
        fh=7GUkYp77VsjNLud4wIPSiE5Pl/mRRHLNl12efWqsbZI=;
        b=sfTKctdImSMLodq22x9mN1/s8pSlctdTgsSpHmnNdUD51d9xFhTluAJwzYhDrp+RJK
         LhSM/RVEVZ+/irrejfZHL2Maf1jpWYK6g8YUYn+sdUgznYzxScibUZtLtVwZQu5uLiUc
         iMORKEgBzKtPiFjfSOvFIfLzaJFJf7SzM4aDZGHCbB60ksFR7QeKS/5LT//+PsuMRSV7
         oMd+taqqcz4YtluZJukP99jivczPpqIu3kWY6E2vJ0kcpaDnSAmq1KlSXjI0lvlyCfP9
         Grwsh2OInj3YDpLfCqQYaizQuxS1Y6Mml3uJYFtxc+mbbb6Re2sBfrmuZsxzHDUXwH5M
         iMfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792145881; x=1792750681; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lEC/VqWw8QmnDgQ20hndozyHJsfsJu9lNxjgfFPQVRM=;
        b=gaO0dqiQgHhlugzVRXUVXLn93H4c1WGA0KZPR3rlJqFAtsglClBtZf5OBmPDEq0/8C
         S4u3ZJyDZJSxNhznF2ZwnIediQc+reYD80v5G26yrqxPCQO2mWPBizrUJN9yB3jzt5ek
         A3H1VMIJEhB6HIA7OChwjnd+1plX7clnqfDy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145881; x=1792750681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lEC/VqWw8QmnDgQ20hndozyHJsfsJu9lNxjgfFPQVRM=;
        b=I9Jsb7ly4UyoSDuXhr1gg0YWVQsO0vHApMrcnGDfgh7l9D1xAPXeL2vrhlzFMTodam
         e6n51sz0NqtOmZYEz8mtHN/N22VBHHnhoZeOTmQVBpAdlgx1TqY6nX1grLtYMmZmsEam
         NmNqrLKu0JEm3nLPgW6Nh7xr1YCiy+/h8lz93Nm+L8VIp+kKFOamK8bvb01hERA+Ysoa
         xNGIWeFLhElCZgEDgYQT9e6k9vykb1MVNXZfomDhQt4Qp/HXm+7E3m5IUCuKwxnouV7/
         8EjPfhH6XyRXc9KeYYN7ciuLqYCczmW42e8bS0Oxquhbp8chAlmE/qOW7aweFf2mYIbO
         7PlA==
X-Gm-Message-State: AFq9FYK7KG8/HVAV9ldFrqi0iqZqqwNkkYIGy1udQTcVl+Ed5K9+P7RD
	Kd1efjBuhy/tjLKhtHkgExdGgNDL+rTR0KYoF+b7Tl7QLAr7EiPLI6uNhUUXFhlPNCB6VN5qdzi
	qOXRT4988yOwiWPMEv4HYXNDrgCI0kE1PiTbpgu78aA==
X-Gm-Gg: AYBFou2ynR6ZvJo1Wq6YLezxP98gr2lgMcEdNut0Koh2N89Q7t0OdC1rqI6oEP9Z6DK
	bxU52y7ALJ1iukdglKXMMSEFb2PCFrilVfMDH6cTmnpyZKUcf3nAtrc/nb3FZa+x7KKH3mhOyaA
	iuLRs9F+IUmqSgiSd1bWw0gT3GrdpXhSnriJbnKZDhMOr5WgkxrYsgRCTWF8CW/uTXuUl+ipYNv
	nveL/liHhwdXNKbeOw62AQAUhS1F9CkiBNIi2qU4fYyW0FcWjBpcEzPVxLqvXDNPgojUCgl+kQQ
	nqNfcde/1/76/cIWVy8x9lx+X5GGn+Mkq5+hcyVx+L7Ws+PrguZs1MCkJphhl9SiVrnbhbx29K1
	X5/Sfxfw=
X-Received: by 2002:a05:622a:1e12:b0:532:c057:9564 with SMTP id
 d75a77b69052e-5359fab3627mr359378831cf.23.1792145880855; Fri, 16 Oct 2026
 03:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
In-Reply-To: <pm-fuse-full-objects-candidate-0002-v2-17d6013e5066de33396c@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 12:17:49 +0200
X-Gm-Features: AclHuK-GA-MxM9Iu4dlDwiNkLK28UyhPoiqmCUn-nyc9cOB66nsj-BxHZ_7_UWE
Message-ID: <CAJfpegteiu8+=1QJbHq9Z9BuBHRYnmHAkYn2bMxbxxhNGvpBxg@mail.gmail.com>
Subject: Re: [PATCH] fuse: serialize processing table installation with I/O
To: Cen Zhang <zzzccc427@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 08:29, Cen Zhang <zzzccc427@gmail.com> wrote:
>
> The processing table of a /dev/fuse endpoint must be initialized before
> I/O can use it. fuse_dev_open() leaves pq.processing NULL, and
> fuse_dev_install_with_pq() publishes fud->chan before assigning the
> table. fuse_get_dev() accepts the published channel without taking
> fch->lock, so the installer's channel lock does not protect the reader.

Thanks for the patch.  I arrived at a very similar fix for this issue:

  https://lore.kernel.org/fuse-devel/20261016082243.2865588-1-mszeredi@redhat.com/T/#u

Added Reported-by: tag from you.

Thanks,
Miklos
