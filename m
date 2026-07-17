Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6542B321
	for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299926; cv=pass; b=mFkm/7Sq2Alg1CWPQ48dCGJlhv62Jtkc67dl5p34UkznWlIhaC/TwPx83/kMxGpNk7HJNvcCOjQxJEl5DUN/vILblAxrlsMgfwMhlhTbCkjVFrKssO05j8GMNebbfEKY3KCWe8mppNwdqh8P3z/BV/KvuFyByD+MXfPL+rRxUHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299926; c=relaxed/simple;
	bh=uAzXCvE2KcltkNGnBxlrXWZqOoQ58n0Pg23BbrmDi2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rq/6BaH7c9l9FJPJRULONiMpvY2FZ9+7k23ze/87fzqrhsOLJVMHyNuYx8+7Bqz3sZPU10uWA3E/b89dgtT7j/vhdrpNhX0mEJWZ0URn87N5CTznt9+qifRfzs6YO2K01rEvY2ITwhWhiqHSIfn1gJe3yy4KT+C/5rOdmDoIoS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=a7WlJFnV; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="a7WlJFnV"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c1372f84dso43670461cf.2
        for <fuse-devel@lists.linux.dev>; Fri, 17 Jul 2026 07:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784299919; cv=none;
        d=google.com; s=arc-20260327;
        b=shiGSZ7TRtpN941+mBuaS37UlM/JHj1kXzlDVrNWd4jFQ3t9UwPsciTDxTZvt0PBwv
         M4mJ3aFVPETuw5zhFdrY9PcPeKTFbVr5uF9GgU1hQeK+ENXPX/0cf/H+MFkshfF3B0UC
         3eGR1F10Mx2mypnBxSQO2aeMoayI/oE/HfQ0le3a/aybGPFq88tVgFH6nm4zUyRX0ua5
         xVjxVSedWTIXE4wZ4ZFrVFS2SE0ZPWETJCYJBMn3OET8Oc4ZKjyu6dfxVsRvu87F9vDy
         2dQnS7hVAhvcfsh+mEPn5RZjCVo66+g9KD5KKm9cetT2dVbZcnSWGPD9isq+9ezK5Pqn
         eyrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uAzXCvE2KcltkNGnBxlrXWZqOoQ58n0Pg23BbrmDi2w=;
        fh=ByMv7CNxJSv6AVuPgaoTF9S5CKtgHRoTjHUfWAIxsO8=;
        b=NHvm5LmVwXDHHclAKEBjxsindRhPn/79kKXDXzcx1rE4S4t2U23riDka403tgU4X6+
         5VHs++iktOpbWZPnOgd+ocC/pHmOrK0oYLCo5qtpgZYmMm2izy7HYyhickzWuZJWzj4F
         EH1JORaLCN7+wi41UwJ7MwdyVQgmD4jx24/N8YlrTD9fHTEYcjEafBVNsidWvbQE8BOf
         Q9ePM6SLXK9w461y2PtwXJnG4Ya+wHAahu/PaRejtf1ZAF7poA8JCIycTJF5W6B8nrfW
         V4wYRqjcNXg3vnGlOfcIMXQBcwI15LIwPf252lVA2BJmV1XigFaTORh6AwM1lpIs1F6T
         fLVg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784299919; x=1784904719; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAzXCvE2KcltkNGnBxlrXWZqOoQ58n0Pg23BbrmDi2w=;
        b=a7WlJFnVoOYPbQy6Utg1Qm8G73fiPRkaHzMuyLlpD92iXSFtnk/FIj19zhXf/GpwSA
         MiYTL8SqqY+D9Tf3CU72eShNzd6bXBO90kPAWTU3juNw6TGiNtZcMxFlZSOrQo4MPU0u
         n9Icj8IEpTVLQEfYBZ+lSaLM8IkFmuBz5GHCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299919; x=1784904719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uAzXCvE2KcltkNGnBxlrXWZqOoQ58n0Pg23BbrmDi2w=;
        b=CcjMk4TS3pjC0UO1yvFIBinvLqjTDY487oIcPmaSfRRMSgiE8PdzCVi2XWMH+ODc+z
         pt3a19UrQUwFj6eWo0dNuXR0cM4fHxok8qt30LIme9dIQ13HmjL5dY6bnTLEMqFVAAX6
         mLFG+53KMH43h/Fs/zev8VbuL/eiKqq7zGdBSYqGS3deJg8C+KgbO0BHu1HdNLXz4q4y
         MHoY9AaRfgEDvFxS/JGC+EVwbOL3d4TpVJmYBe6MIVq7UyUxSuLnerjjePrHr+PesOVn
         FbaSxzXsPlYeH0PWwF65Icg0BE+G2xe22VWsl4R1OQvOM7HTSE6mgb3QsrVJyLKz84Wd
         54rA==
X-Forwarded-Encrypted: i=1; AHgh+RrWZPlfopMTAbKkVXM77awjfDxXQVz/5oelTZnNvlFAQBHNkuBfiRM+JLG9par3iCwRc1YGvPxyx1Pk@lists.linux.dev
X-Gm-Message-State: AOJu0YyBqFif5Aju3AR3YQ0etFuwkjA7Y8URaZS+oklTLXn81L5KCw0z
	U6i5iI5QGmJ5L7dCB4xs4E7mVpiye8FU3UAVb/SYsnnaGfnDi5XcYVl6ihVJPgvsKpqiSS92Y6o
	nE0qdz7U9LWwPr/+kbHQq+tauTv6G2OfT0VcK3gElHw==
X-Gm-Gg: AfdE7cnC0//bafxo0kJCLmUqtwFVkX+Aibhr+OPzOVJz1IvYWrCUsyGGTyMN7w6tQUp
	0BZoiAWFfW1ZlF0pXBYbTrJPl2la5j0Y1vuenhbQ94Odbp9EVhsMIuHYNYp6emio4Zgd5IvuHgi
	e8ZJlpPNMfvD4VJy/FRLOe3EwJmoSgQ9Jt6axHCfk2ufrzJCsjQCCrtX3Okwrm+6wNx4qV996md
	9Dy10eJvnSofhyibX/Uvtp3ra3v6+lbZyqFEGS4hoTomJHYXg8l1Cri5LbBt4wjKrZwJHxjx8jm
	Xp4q3V1pOQbL0eU=
X-Received: by 2002:a05:622a:a588:b0:51a:8f3a:13b9 with SMTP id
 d75a77b69052e-5213aa6b248mr28619331cf.16.1784299919090; Fri, 17 Jul 2026
 07:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701110052.5309-1-luis@igalia.com> <CAOQ4uxh0Jsa-wqXsTnroJ7W+8hspHEn8ZUrpaxi5YEOZXhCXZQ@mail.gmail.com>
 <87pl16c2z8.fsf@wotan.olymp> <CAOQ4uxg-LcCp5_2OGFo71ejJEPc14uL_D6n04jwy3C2GuoWy7g@mail.gmail.com>
 <87o6gp7ot2.fsf@wotan.olymp> <CAJfpegt1ObYX+6+GQ+TcWqnwaYRkzUS_YhVwEN3rLYE0NqQWvw@mail.gmail.com>
 <CAOQ4uxjxGeGW=ndKTQ7gWr4N2DJLMxtK4qdhXDFQPrVMMQgDZw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjxGeGW=ndKTQ7gWr4N2DJLMxtK4qdhXDFQPrVMMQgDZw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 17 Jul 2026 16:51:47 +0200
X-Gm-Features: AUfX_myCPv8gqS85wfNhoUyn-GmBykNS8Si7LX5jC_P_7VMg-0CfmGcBwv5UGuc
Message-ID: <CAJfpegtdZhWLpc12z3khfKyfRK0kAEu1u3j2QtD+_JL4qaRO0A@mail.gmail.com>
Subject: Re: [PATCH] fuse: cache POSIX ACLs when setting them
To: Amir Goldstein <amir73il@gmail.com>
Cc: Luis Henriques <luis@igalia.com>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Matt Harvey <mharvey@jumptrading.com>, 
	kernel-dev@igalia.com, Seth Forshee <sforshee@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jul 2026 at 16:43, Amir Goldstein <amir73il@gmail.com> wrote:

> unlikely to matter if we do cache on setacl or unlikely to matter
> if we don't cache?

Unlikely to matter that we don't cache setacl, because it should be a
rare operation, so an additional roundtrip just shouldn't make any
difference to performance.

Changing this does carry a small risk of regressions.

Thanks,
Mikos
