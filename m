Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F87C44212B
	for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 09:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044962; cv=pass; b=arPjlW81DbFHVEqXtzBhMyoCzM2jLR/Dx6w+ZDJAbm3Qh163PXiaEToo9UMrqzcyBrGmN/K7qpiEhyzpFdhybENY0lcB0Wv3tzYLDLQVl7RdUS3uzfDxHY0HixrOicIlwDV+Au/xXvu8eWfGUP7nBzLwor8qlYgoxxEK2EBw7Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044962; c=relaxed/simple;
	bh=QOsIj7oHlKxPR+bfScX6z8QYgUfcPjn6GIkbh6a+ne0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPRIuO1ht8SLl7rrSvo+e1mHsOo6xnqYfzj6jSifF8Eqhf+nARCw/750v1/qxK6mXiirQQtf9v+tFc02fMulEJAkC7uh+v6Fy5owO8ng1SfSLiI6OPPIIxmljedP3/ATPwPaZkdIEQH0jpYR7PIXWjmrn3Wa/RGQ4Ki6N3QfZFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ViRmenxG; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ViRmenxG"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51bfe810293so19908091cf.1
        for <fuse-devel@lists.linux.dev>; Tue, 18 Aug 2026 02:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787044958; cv=none;
        d=google.com; s=arc-20260327;
        b=bTvvnl9/QgAhHD5xoS08vUnR+rFQ5OWhayOriZV4qYBQ5ItDJLnTwTbWEUaMOsiKyg
         2YMG0gyhKb2UwqWZQBVVOjJpqr9a7vZHBElztfsqvyLPh3YoMzpKAPiftc2amnOpUBtZ
         /5ELw6Jlv8H7mHpFEoQmLaMgZw0+YjgxWb8SoXBDq4Z8go1MJB6UCMsrjwEDr4bRM83M
         CNWYCYQBgtiLUhy3CzbFfnGoPa6GvO5fQSbxn4JTXZByZpZTOs1Z/33HgmzFopi61cma
         Jn5PuQ7ZHFFM0AWwRBajaiCA3y0FqXqpXdDIhqm1fhafUr5kn4jeufGhKoF+YcVQIiSk
         8wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QOsIj7oHlKxPR+bfScX6z8QYgUfcPjn6GIkbh6a+ne0=;
        fh=BDMKgbfEFlxe/XvT5W4FXWTkVjrXFP72Q0neHIdohTU=;
        b=bF2nDVSj06aHV6iSysdq3ffCYzWn0eQj5B/VqEVMWRLEUe7aKsulg0GNxop/z5QB/C
         Ds/pBGpgvGHhOFifUUntxlXSWPPwu8SfhIY+l5S+IdmUjy3EqLNzd7lrB5L96EIwWwMp
         2Tq0NO0IkIFNuzLnmpd2a6X/OkIij37q3mjkt0wfS3UwbqCQqjEpJdb39uafOVilwbOE
         mkkULZ1fzw/4cPbXT08h3tACTICDXYXxP8HeiS8vN02H5/LvFO3kZZIyuGi5uudVDS5X
         7gjeXfs9W7ZQXNyAAOt5lil5cJTS1xsib9x1RZL/6MdweiK7syMkgJg9JEGKZO8DmjdW
         e4Pg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787044958; x=1787649758; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOsIj7oHlKxPR+bfScX6z8QYgUfcPjn6GIkbh6a+ne0=;
        b=ViRmenxG8Iu9xiirlYNuCVOEjRI9nvSNBCINFHyrSOpXlMIeDCtVNQIpSGoFRGKcrY
         GL/MvdT6+yhlCcGHo3spAQhorpbnrADKE0USkj0zc6Hr6IK/81OMcHMf3dSoQUD10765
         3xa3WLflMGGbHPSHuNG7N+icFV3QpnYqq2hpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044958; x=1787649758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QOsIj7oHlKxPR+bfScX6z8QYgUfcPjn6GIkbh6a+ne0=;
        b=ms3fNxqUG3dKxLRpT2Rqrf/Qa29UkSHYbEy1A6ZTCtCxVfg7SBGPM8xCTT1dcWFj/t
         QnvzaQv6B4axEjddSWHOH5l30nrMKnT6p00xdBRr1h90TVMgzWTiUWIfRjO6jU13ksNg
         0n7Adbdsojq7511dNhmPHJDBt1aEDK7vyQNF9WcBOIqH2sPqWOswOZTSfPjh28Yo+W4I
         PxkkAqML8zLTf0mJidiskjTsa41w/DBJJ5BlGLcuWz0U2phda+lkVInXvV/DKc0i9ymI
         2+QUJsHOrqw3AkDK3zaJvxgvO+2DQCpdnVPWRPYij23PoUFVMEkT+oQef6w1PbuNc/9c
         zgEg==
X-Gm-Message-State: AOJu0YyJuCrkfJT/dT1nWcYFaF7UIXNQDfn8q8e+cJ5uil9wpGgEohk2
	PvAGVZ8jkMHXJR0ox6HH8hZffl6kHuCJ+/97qS4qLnQsQY/u2UPjs5AZgyxBqWSYPrvIIX3PGFA
	qVSSHFAl4kYA1NjUbveOkkrSr2kza9TY4Hx1jJy7vQg==
X-Gm-Gg: AR+sD13nNI94CJJG966bTY2U0kUxrNg4//aah6T7SQe/4PyuSeDDC614EvgxD4p3oKe
	iUISpA4ojDQlvmeFPscv8icmV4ufh+5JkZ8YGUe5AKU/AfksK0vQFdtnXiStVJcQozqK4krR1ZY
	B2R74GS3Mb4tGI9lgUKuKmWgUsA6UuJix3H780hqOJ73Z5YWGpTgDqWI71ArxYL1HTZbpv63PT/
	bvP0Ug+ykUnw/qFLByJv9GByNvWs2TsFPVexo/b2tN67subUv9RNLSh6Cefy5iykgILp888iE91
	3n2bj0qUeHcKM3BKB4ji9i+c+7lhOE0QDd1ymbWbUY+12eLLqY4iNutN6RJCsGtoCtwCqIsF+7L
	c
X-Received: by 2002:a05:622a:1790:b0:51b:f640:2a4f with SMTP id
 d75a77b69052e-52d853bbb8amr318791521cf.4.1787044958684; Tue, 18 Aug 2026
 02:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808041339.1687459-1-libaokun@linux.alibaba.com>
In-Reply-To: <20260808041339.1687459-1-libaokun@linux.alibaba.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 18 Aug 2026 11:22:27 +0200
X-Gm-Features: AcwNN1VItSWEE7RBF224CaGW1gStvgzdjPq0b8SJPr6i29MjpJAo-VJQ8ZFtyHg
Message-ID: <CAJfpegs2PwgkPNVmHwpHKJ4Bs0R+Qw87xEcCvWVGSgcZhOWPpQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: check for NULL root inode in fuse_fill_super_submount
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mreitz@redhat.com, jefflexu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Aug 2026 at 06:14, Baokun Li <libaokun@linux.alibaba.com> wrote:

> Return -ENOMEM instead; the caller tears down the partially built
> superblock on error, matching the other error returns in this
> function.
>
> Fixes: 1866d779d5d2 ("fuse: Allow fuse_fill_super_common() for submounts")
> Signed-off-by: Baokun Li <libaokun@linux.alibaba.com>

Applied, thanks.

Miklos
