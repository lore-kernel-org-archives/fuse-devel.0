Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793244460;
	b=cAkoXZwygLqNwCwrjRh2R/W8fmjzPLnX12g/bCfW/sO/bqXW3XfrE3wArLJutmtZMbkl
	 /2GS1PvX72Ps57qU7KTV++tGqi9vTCQjoRCG+zYTvdJYh576V9lsUBRu+arzVOR0UxM4j
	 vYui669wf5zDzzKc7go5muoH2GvpsmVfPIcKvXK/td5bORUoLpuWSx1CEEauhmCi0PXnY
	 POLS6dvQ3NWUmRlEcciVy6SvYzT0LlebZbrLwT2zzM8PRHa6UcxotpUOy35Kva0nBBIKE
	 VdcBpHCDxkol+C5wYkiG4kHK8mEOSt1/RXwaAuz1mFuftXHkI9JEqFv7GUWBLl4uhEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793244460;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=0DjsjpXU96UP9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=;
	b=gvt7KctSjHSKPZ0BGLqz/2hz4d4Y7tTzN+FArIzUjA3dD626Wyb1PGrRAAq5sIiGAlgV
	 eJyag0AcvHdVcsqax/SfCBZOSiApChg15K22/36d2KY5TLOaGBYgfbTrE8KCSXHRSsFj/
	 hCLfarMmRLORfR6DnkrfGw2RSMqWrCLei4TD8EPe+MDrArII3ugvFK7yvNjaNNhAfUPcC
	 gMlqvzeXJEyNeHfCY6CDnbBFYIra9U011eXfF7oSw/7JJ6JZ3aK7fLD2ODOKexijlt7Jq
	 KEfcfPv6P26sp0NIy4tDIm1TeyJ70UmVjjkpfo4d71nWKEpvPyrbqGI9Ow5yDMASvFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=gmSxhDFw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880EA606A325
	for <fuse-devel@lists.linux.dev>; Thu, 29 Oct 2026 03:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 880EA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=gmSxhDFw
Received: from pps.filterd (m0528004.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T3IcTu3604666
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 20:27:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=0DjsjpXU96U
	P9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=; b=gmSxhDFwHSvjFfh3grfM61H6IYl
	/+Ns3n/+6o8BFC6o2G1GzFtYw23HbA6l+EpCNLDr9pmO56yEGTYp4GlY41fcvnw7
	7YsDSeNG9PCpxfL+ESWZH+QcFRfov2pfCG/7pfgsl5czd7OimMkuoAB89+OmRojZ
	QnqBaA+FJLPouNC1oia7VKdQTjybhJSi/uQhjlKFhWfWgaib8ZjHUSwVuuaekVvH
	uWvSyIwGRewKHoBV2Qf1OVEsWPYIZIGtAlh19aeEBvx/2OW2Zj0oED8wpjHcOy+7
	5RP+qo19y9FifMRm/HXv0PZKOl2tiFANfsyzsKf9cJCSs6wEl4A/8CRpkrQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hk04jux0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 20:27:38 -0700 (PDT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-193b5eb133eso1950790c88.1
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 20:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793244457; cv=none;
        d=google.com; s=arc-20260327;
        b=Rwu8GMjJP5zv5nSBBuDAHEDD37Y5BLN1+I8/Ut3R7E6KdbFHbri1ZY3L93xFWXFqBV
         /Y2z9VWDTYjaMQJm/aDPfb+jTtPuqqhs7LT9OSgapaK/Q+uUfRpAs7uEkqRgyOiKb9T9
         rDrEzWYZKLNQURpagN1xe14YAqa1moTSjZmZyN4meVTDyaNwbcc+KDgvsoipcVISPVBc
         k0FLUAZCncUHmd5KCR/tHgJOb6aFYkk3uPjPDIIssdgCKlum1f/4fVW4dXlK8JVTqQVb
         7vFK/okrMCsH0TRfcvhZkh038p25iW6coRRcD0TCsS1arXTs2NjTD5Z9+VOJqLq6bd94
         0Xjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=0DjsjpXU96UP9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=;
        fh=L1cQU0NNswFy+Dc6YdGfzOmeKh+cXecVWmwnlay5mMs=;
        b=FGfOFazElGJteZdEemL1WFXJPbRS1ZC1C24hLIgsQqpbL492PC7Qypv3+3CouGU6M/
         44LfynxAX2GPaPZPWLylOqavcOiCBQxjYl1KF/mzABzKl+fdNv2dcG61yuMv2VHT5k7D
         iHOgDQtgeQqQoXQar3z++vfVWyF0bCbey/BA7be38o3Hza4mFFPjiveSKhsH9RPCk0pk
         hFM+f+YRs8TH4j9hoJaOZKOLYsb+1UwGLK6S0ZCxc73eAHE6ws5LXehAhl+mjtfCRRs2
         HRj0o9zgFK1j41q/KYQ5SXAvt1RSn8bIcsLPMgLcWpY3bUTFQHz5gWU6HizcVfpsYnjY
         uJIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793244457; x=1793849257;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DjsjpXU96UP9kDusHJgpmPdkD8cLQUHrfge/mnRBFE=;
        b=2OOpcerUmEKPC7av6qAv1yAnGAuW4PFp0vBwbChOeLcuB/FcI9m0jNz562ButleQ0q
         PmRsThVfQX1Dys0Pu3Axjjbq3CdVZLULNyqTwKH1RRIU1HjiAP7D7NknSsNUusAf0E+I
         Ia4Yv3WB6KYQlt+OTfc4PxJKCnPD9RuPfSe/tcA4mCvBBNxVvG3cRMB4uVHewRyST6pn
         ru2at4jxYss8xPeAx/WW4c8Y0kUJ3v+QruYp0PLsRfXoOCWIwhaxQZFvAtCgr+yAucah
         8Y3ULb3MFsjnqRasaGrK9PtIqE3qhyQB/y+tEh4eT7eVqLN1DMfM9924SO5KvddQzdZs
         Rgbw==
X-Forwarded-Encrypted: i=1; AKwUvBwjxOGF1LF4NOKKP+fbrmtgAtMkZQshd8Gz0vgUJaxW1HoLPxRXz4EX9K+tPjH+D8CfjU3nlarN6OFm@lists.linux.dev
X-Gm-Message-State: AFq9FYLavpQUa5XCCuKz7QEJyy9A24nqesC0RJuM2kNA4R3JxpW5B0cI
	JBXHidz0Wkf4uRe2ntDHQqN3I/tCZ2iSuYCuDvFp4C8tjOj/nmJpI52h0diHsLELv00dSVxYTZ5
	UhZEfCk6/JghMam78fnZejAeXZ4hW06EvPGHs6tG8nE9PzbFN8Ew9utq7F2ZfC1CavbF9ZqEkVm
	aEDqHRsUvXWNcA5KNw3ml7is4SkVVNVG01lalaf/a+ihmtMZc=
X-Gm-Gg: AYBFou3FMNpsF3oovcUUiVFuD1SD5o6jAHM0zpejKNoGyjFnJjOBNiDZqvjulBx238o
	dW7x8rDvxuJDU/qih+GdeLljxAo/AVEUz/WtnhV6hBKAE37r2tN5Ky9r1qjm+rnyqvDAwXoVV4S
	okcHV+XMTftMJMkYGz6b0lGMbO3ZLy3t1+c2JpaGSVh37YUDhrJiZLVHY=
X-Received: by 2002:a05:701b:4203:10b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1a6c9af1e26mr5876952c88.4.1793244457448;
        Wed, 28 Oct 2026 20:27:37 -0700 (PDT)
X-Received: by 2002:a05:701b:4203:10b0:143:3c9f:10a6 with SMTP id
 a92af1059eb24-1a6c9af1e26mr5876935c88.4.1793244456694; Wed, 28 Oct 2026
 20:27:36 -0700 (PDT)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026201101.3915217-1-leonming@meta.com> <87se1qhvz7.fsf@igalia.com>
In-Reply-To: <87se1qhvz7.fsf@igalia.com>
From: Leon Ming <leonming@meta.com>
Date: Wed, 28 Oct 2026 20:27:25 -0700
X-Gm-Features: AclHuK-KIZ_96J7m8EUFsiyjK1WGV9FQATfT66Y3r8LemRe76Zf6qMGUQGEgGVU
Message-ID: <CALJ5FXmnb0QU3KtmE-0ieX1ApTSMG0gZ+Hg-TSeG1G2mLd1itg@mail.gmail.com>
Subject: Re: [PATCH] fuse: set dentry epoch before making the dentry visible
To: Luis Henriques <luis@igalia.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joanne Koong <joannelkoong@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfX3H3wxotn3UE6
 6y/6+vyqxyHSjsA3sSXYaIPFvqjkD1gxQO11DvQ+dwcWPVCLi5sTHd9Dfp/kw86mYecUcAoEtxq
 5u5v1PPYABP95iUu7l4X/mCWa8qhtWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMSBTYWx0ZWRfX5XGFhxTImeyo
 B+4xZlpNTA5YpOEE78ObrTI3Ce1B+I321Bb7O4zP5xgfpZglVSzjeLRMTNn8Q1qEVVFBlUzyueI
 g0UCT7d8M7jZN0knQgQkO8bsEgp9Ru5Ec4ZmkzNccGM8G0SvJrr1/x1EqMcfZSTVYLCTCzgrFJt
 /9OfGf729Mr6twIoTmmHbiKnC6X/D+PnOynSoDRfIeutcJK5BnESD+1br5OHmq9X/fjU5dS6Kof
 agaOijYrsOWcqbtVwDJnsn4uw+QhLIOO+dF+hfcqCK98sU2XMiF0Cy4u+/wr7V1JyQ5iXYSI4Rm
 TqeGS8L+1VKY2f4zieWbZYNGEm35Bbdn3CrAPmyEgnzDDsHaGVOC+ODHnqXlfhQGQs8iOTu0Bh0
 8bj3N6unZgB/6eCJC9R91cNISl1ONUht4IVOBRA01ALG+tkKmWoGSSJUpOdZ3PsHyziIkViGE0S
 gUd5HWQj+6lJH4Ig12Q==
X-Proofpoint-GUID: RKulfu5McStHvzDtMB3LFWOAl5mMcjmR
X-Authority-Analysis: v=2.4 cv=ELiTQFZC c=1 sm=1 tr=0 ts=6ae2bd2a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=GbPsI2Ihf5RTnMjR_gZv:22
 a=V2sgnzSHAAAA:8 a=lT1PLGjMyznquQLvSy4A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-ORIG-GUID: RKulfu5McStHvzDtMB3LFWOAl5mMcjmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01

On Wed, Oct 28, 2026 at 5:03 AM Luis Henriques <luis@igalia.com> wrote:
>
> On Mon, Oct 26 2026, Leon Ming wrote:
>
> I believe this is very unlikely to cause problems, but we're slightly
> changing the behaviour here.  Before we were setting the epoch only in one
> of the dentries.  With this patch we're *always* setting the epoch in the
> dentry being looked up, *and* possibly in an alias returned by
> d_splice_alias().
>
> Can you see any possible issues with this change?

I don't think so. When d_splice_alias() returns an alias, the dentry
being looked up is never made visible: it stays unhashed and the caller
drops it (__lookup_slow() and fuse_direntplus_link() both
d_lookup_done() + dput() it), so nothing revalidates it. The extra store
goes into a dentry that's about to be freed, with the same epoch the
alias gets. The alias itself is still updated after d_splice_alias(),
as before.

In create_new_entry() and fuse_create_open() the earlier store only
happens after the server has replied and fuse_iget() succeeded, so the
error paths don't change.

> Personal preference: I'd move the other fuse_dentry_set_epoch() into the
> other branch ("if (!d_in_lookup(dentry) ... " ).

Done in v2. One catch: the alias returned by d_splice_alias() in the
other branch also needs the epoch, so v2 sets it there after the
IS_ERR() check, as fuse_lookup() does. I added a test for that case; it
fails without the alias update and passes with v2.

Thanks,
Leon
