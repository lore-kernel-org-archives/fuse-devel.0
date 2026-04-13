Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DB3AF667
	for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079111; cv=pass; b=WGgj1HnFQUVYwKoDjKybZok2YC9nJGxiC5jZRWxKhU8EeWJZDkBRDFjOM/6MatApMRgE6XwhPNU64NBNz5oYRoySRFxi9CNqNC8EeJZz6LyYrtgohRM1rAvutsnU2Qz4mB+pqOVnvEOI1N1CXn8RNqgeKQEhkTBKroQkNLemjkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079111; c=relaxed/simple;
	bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=GcLD9pgVNR8E4Vlm+uosMgJmTGYN4/91QT/0VdigR0/llW5PrflYp3mvaZR9Z89dO24krOsINImrFLq2Quy35afObhmhZ1Dv7CdmLjsnzNpgQbcC7Xh3uqOJy7JJKoLwTaq/wpN0fl41jhckx1mq7adfJV7leRyquqMYKWJTv6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KIAwRyQw; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KIAwRyQw"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-66ee7b9af94so1437562eaf.0
        for <fuse-devel@lists.linux.dev>; Mon, 13 Apr 2026 04:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776079108; cv=none;
        d=google.com; s=arc-20240605;
        b=UGe2tVgiTtTEaWopEojAAXNa02XFeXMjALdqtjsx2CufEQVg/+JBW/TNaamLLNNq35
         u4eFEoQZydRUU5W6OCX0gAy9tHZBywFAV1+3c9E2DxFGT4XZ3h4RJdTz3WYOzh8M2jgL
         Qlw/TuP3suzJPGzHA5qGLtxDAJvS0wXI4bjnIydjlbXF1AZ5cnAoilStm0Wu8KCxVzXY
         Uvrfq0cO3WQH/1oG4Z1ucsNAAEn3UNlbbUeM1ms6GRA95h0HzxpfsBFQ/kJku8RUeh4S
         mMHLTwOr4y+dnvgaNz3E/GaYOVr5LFKnPrd6FhSHDALN+xyoJgWsqx8phkm+ep5tziSJ
         qLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
        fh=2P7+SZ1zMoYD1jSS+Q4zKbqWZSnU/Eju5cv4fUgRgKA=;
        b=EQ/tY8v2FIDromqSGEO7hsUQwNS2bdY9IBk3iT+SPQj2CqPChr3hz2jSlp+aFasXWC
         rhOJYLMfIbN/sQZKgxEl4UofFsfb4fIrDyCgXaHM6kAJe1YZJ9+0iBFXW7N7fS2VWkMX
         PhVcPu6K5o0pKwtP6CV119Grt3xvR2ZoA9/CAgvhsSzs7i5kPdcYorCtT0UpKA3cMlig
         15UwHuGe5yFo6R3uHxlKoeowGQppS5WaNGir1/WqblNh+Zr/a9bOrbTs4VIk0atBcaaK
         FRbi8b6RMMzNxav2h1n/uqLtYSl27/gk7b5rWCf/VqvhrPTbtxzeAZVZzIn3fdNOvS2w
         W4dQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776079108; x=1776683908; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
        b=KIAwRyQw/xjCfiCd6WELSDmekaG5jtuIYmeq27jJgXKWk77a0KiGtYlTLcTIR1Wzc0
         7hpODhr2oKugnw6Qbm0myrs0AyCri8m2ubnGRTGY2qtHcyNFwHd5KTHTjOQKpiPdhtd2
         FYFEGq1EjOLubWUPqpkW31z7gdPic3G3W6xJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776079108; x=1776683908;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FH1UNRTG9iFk0SuOYppzB8q5Ofc7uHUpfUT0vXMgwn4=;
        b=XHvhqCCLVzRsqnr54opjOXSnbqsLoIO/EPFwrDm0FEgUPY7L7DLjh+3rAIio80An+Q
         If+oth8StCvBbi8zOzE/FH1CEZmYl5KM70kOspFUGrXujCzxgCfRbAF3I6DnYyehUd5P
         CQL8BJ2pCfV5db53TVS/wjV1gs3lOuNh/nKosjoe9Tzb2oS88gYjmI5EOzmTu3LPCSdG
         0gYM+10R/E0CQJOC/Zi3VB9scq3xKNmgmamBnXwv6mc0lmwDRWCQRHh+ppHI90GREMFE
         amjOdChftH5u+RAslEM7l7OeDEZZpaZQCh97MJKva1Fmgxm1VmufFIIu/8lBQoSudN3P
         fDcQ==
X-Gm-Message-State: AOJu0YyfajiMZKxr0W1uGu3RGKtuc6SxxpPXCd36BeFC4DSoej0qrdG2
	xAYh+bYrE8VRu/MWzavUnvQiw4/8Ngj/7Clbk6v1qeyNPL7lWG6oEcFuIDBFZXhpwrwoMHZzkSc
	1kGCcXFuKjVbvEyc5FDET9nL98gbEH53POrv4BLdbBcJEDgdx0sMEyxE=
X-Gm-Gg: AeBDievptuNs/4dP/mGP6E4PAR6AO/zb8YjEN55wDG9qUUzT142EVCB2TbZeyOkFhau
	4OSRpGyI5Zm8zAHL96FqFdkH1a8PVYtUT+Jmlp0atqQSKiZo3URHLkC/SBDoY0E8DGyDSqRz10i
	BmjoPIijpfZpo/5iIysuRfK2lgqiagACfRtpcZxK7QPRpCfJNCDbVd9koH3MJOaIuuRB/RMTyuv
	8rV9omq1OXE3Hd0VwWP/Y13mzXChZqY0MMdVjHbARSG0Wg9oj1BR5djSAJ4mYJa0AqM5LcfvuQy
	nO63AdxfJWpiBFw81Y5wl7XWLe0N/IG9QN5M7w==
X-Received: by 2002:a05:6820:330d:b0:67f:c06c:a5e6 with SMTP id
 006d021491bc7-68be7ee6967mr3840271eaf.37.1776079108134; Mon, 13 Apr 2026
 04:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Christopher Hoy Poy <choypoy@linuxfoundation.org>
Date: Mon, 13 Apr 2026 19:18:17 +0800
X-Gm-Features: AQROBzBa0fOpSJ-J9G_Y1k_mERiYuGroFyH_EZyxqtIUaWkXEKRXpwjRE5GN6OQ
Message-ID: <CAKkv+gzgoyjFuvPd4MLe+uqpLgADtXyMbJ5nChYCr9j33Bds8g@mail.gmail.com>
Subject: test
To: fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

test
Chris Hoy Poy
Senior Systems Engineer
Core Projects
The Linux Foundation
Perth, Western Australia (GMT:+8)
