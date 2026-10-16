Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8D47F2ED
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157401; cv=pass; b=tHNBJDtWIZeqiabOyQN33XPquwAjVQ9BE9ySsitP5cRIVFX+70r1wb/DCZZUEjNql5EP9XUQbrR6CklEzw0rqIlHl3v3ZVvN3WG/xMIxTDi/f9o3KSKoW+/hJJ9ON/PvQR/i8jS1SQ/unElkmZi9wZU3W54QdCRxVBYWdBjCZrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157401; c=relaxed/simple;
	bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzRwDVPWk/k3SDExCoMcgpCI4PgX1rx1l4HBYtsTY4g+xbnOWknrjs/rdCp9OvFfBRF1iM8WFVbmfNTkkNo//4Y+Jz4wpt6S64YYBPUEpRQN0thpL9lOLL2FN6Vrf02RI6s4/sVMBQe8AeDTyTbUI917m7jEDsjgSBn6iGFqgHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=MaNo5LLZ; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="MaNo5LLZ"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533797e72e8so16152261cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 06:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792157399; cv=none;
        d=google.com; s=arc-20260327;
        b=pf9Kon6V4Of0DNWsKDUdXd6uxbm6rRPjy0/e7N8ysJteWzp5hGM6m0dYiGPVi67+h2
         TwNo9E5Sm6jdj7DF1ZYU2OQrrSRzuzpZDQGmxsV1x1NDAsOZKT1xP5/Wzing7aVcY9Ty
         r37AeOwazDb7FFExBsgp9Zu/gkQ/n/ECsxjfWTRJ1BoSICZCl7RaNx8145wd4iLkqChK
         n7ATKT3RNOanU7zUxv881QRN4EkKvUsIejfBtD5M8HfjJpttBxQe0kRrNMRmS8iC+YfJ
         igt9msc9Racts3qEnDNzFK7bpxqzXGhBeqezjpyc/R0u7QRflmALwLRMZ5NKwVXqYEpv
         lvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
        fh=aDG7T4Ci310z1yhMH8+jB8r8qMw0GK4YZnYEF4CxCrw=;
        b=Rnm7J4kL6TNpXjzHfpCrr8YhIpH9huna/mU3zdIS9G4L+twISBwTRYOXXS2/4g3FKX
         YTcPTfvFILgn18JwaANyMcLbd6bFSsK3b5pP8+xBGfF6yToWLe49SxzNQkVPmmwqfxk3
         IPYlAnGJqsgLjUC0SpVeh+xTymvJGgSJb4pCxNhw7tIwoMPl6fUIvFQCS9z2vF6hVqt+
         4o1k2HrB2xEUFPVwgBWrbSeUXdlETln4GncLKc1gYdf/wrGLFEmiceEFaeKH+cCrZRJh
         Z8nh0jNHSHFH5ip4Kj5cNmRsfwPi3gvZ+Q9qCfzzu4X8wPfbaLfHVoPQFkEOhTLHLTRu
         sSbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792157399; x=1792762199; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
        b=MaNo5LLZ+2WstvhWfOvF4FHzYMv3VVWayWXMFVR6tDZ47W5gqceNZcXLfoklW7oUOx
         p0yFKWVamC0ZIkQ/SI5j5tNbxB7lgVAOkLx4YPRwGFtwcPxwEbZlCiyiKyNwe0+AWuTA
         dVJ8Pd2ANu4HzNrC2TlUbToeQjFDWRM+NtMPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157399; x=1792762199;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ghSQBNQLHFKFmZCfz5WoBGUzvoX8ZbfSdQ88iO2t5e4=;
        b=o/eo6Es0h6FeStrLgAUL5poJT9wjFii3iMmFeu9g2vfhajOCE0cFtlXXRQH+LBdGKD
         t4ltDO9rpFgvX0nkGQOyFYxi4Cmd1et4zMDOHIXkeyQ9MgrCwZ10t4/pdPTL7R0UQWH0
         8IkI5bcZUj/eIajxL9zccVR1t20YgGeXRlqHBI+WFXljIZ9fnz88rZqJ1Au2BkCk+mkR
         tTPjuK+oZfX0dQSxiOI6GfxkQRS+CuxMpsraxrNG5a5anxKDe0JfwZacQ8w5qYEd8XjP
         IAVDWzLShBbT+zCIg+ViNiA6zDEel+1pFhTn81x36HG7boGX/jzpj1B5a/6Pc7p9JvF1
         1+vw==
X-Gm-Message-State: AFq9FYKdrzmcYjlo/Je5tB6wRPZ8kkBQWpXGmnmngObqS8qYo32ZOV1l
	k4hcQHh7FA13mZO9Gqu47viMEtS4X9hxfQr2QjqHAJs0kGt6gn3JshETNdwATQJzjfDSiAuSRfM
	KGSkDdSmPy3+yTkgTF1sLJKImUb0Gbo1QwXPylyffgA==
X-Gm-Gg: AYBFou1NWNqDt6u8R8y3Yyg6DrqJve0MP+iBVS7Kp1itsou8AEHhh+j4aX9ahDV/iMF
	MrNW63wQk2djOLGIuUUpzbDlPkVEwFAt8VEuSkmtTZn7VduQ9VSCs8RwxHQcMStP2MTjJCbGwIO
	wM+qrvoFJ1g4cmLBjwKgMWCVoW8+EauAOasws0aYgDRQFE9+myAuHRVlNfHORFaP+KJ/nLNUkFM
	FWpaRz2U7SUYPRpJ/713sDX5Z7sKMISbPdvOV56rqqz8sWjqOCiQwH1DHQc/c3N5ssjNh3C4KEB
	c5uL4XGmcutdWRlDwuA4VUxAV6uZaxaqgEsSjb1zns20xwEPPYNIvm0lr47CqaN5sASnBK0YKk1
	3NIyaZYOR
X-Received: by 2002:a05:620a:84c8:b0:93e:48fc:aa88 with SMTP id
 af79cd13be357-93ebd24d0b6mr3718433185a.44.1792157399220; Fri, 16 Oct 2026
 06:29:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013090447.1180121-1-nicoyip.dev@gmail.com>
In-Reply-To: <20261013090447.1180121-1-nicoyip.dev@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 15:29:47 +0200
X-Gm-Features: AclHuK-Q2nn0oOoNYqpQrR-8kWZpjdvKCpaqHxulvcgHMV-HyAEfr1ZNOIxPAaI
Message-ID: <CAJfpegupo+nAz_ELWYPezK5QsSEQ4-iuiXWrsme+yHvXrj0t0w@mail.gmail.com>
Subject: Re: [PATCH] fuse: fix copy_file_range reply handling race
To: Chengfeng Ye <nicoyip.dev@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:04, Chengfeng Ye <nicoyip.dev@gmail.com> wrote:

> Use args.opcode for both -ENOSYS handling and output buffer selection.
> It records the opcode actually sent and is updated on fallback, keeping
> each reply tied to its request regardless of concurrent flag updates.

Applied, thanks.

Miklos
